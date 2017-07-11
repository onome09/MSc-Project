classdef ObjFunction
   properties
      full_region
      jacobian_matrices
   end
   methods
      function obj = ObjFunction(aFullRegionorDefinedRegion)
         obj.full_region = aFullRegionorDefinedRegion;
         obj.jacobian_matrices = cell(0);
      end      
      function [xk,iteration]= optimiseNewtonMethod(obj,x0,learning_rate,stopping_criterion)
          aRegion = obj.full_region.regions{1,1};
          xk = x0;
          iteration = 0;
          jacobian = calculateJacobianExpression(aRegion);
          hessian = calculateHessianExpression(aRegion);
          subbed_jacobian = 1000;
          while (norm(subbed_jacobian)>stopping_criterion)
            subbed_jacobian = subXIntoJacobian(jacobian,aRegion.symbolic_variables,xk);
            subbed_hessian = subXIntoHessian(hessian,aRegion.symbolic_variables,xk);
            newton_step = calculateNewtonStep(subbed_jacobian,subbed_hessian);
            xk = updateX(xk, newton_step,learning_rate);
            iteration = iteration + 1;
          end
      end
      
      function [xk,iteration]= optimiseSubgradientDescentMethod(obj,x0,learning_rate,stopping_criterion)
          %if (obj.full_region.domain.no_of_components > 1)
          %   return; 
          %end
          xkk = x0 + ones(size(x0));
          xk = x0;
          iteration = 0;
          while ((norm(xk-xkk))>stopping_criterion)
              xkk = xk;
              logical_column_of_active_regions = obj.calculateActiveRegions( xk);
              [~,~,array] = obj.calculateSubdifferential(logical_column_of_active_regions, xk);
              subgradient_step = calculateSubgradientStep(array);
              xk = updateX(xk, subgradient_step,learning_rate);
              iteration = iteration + 1;
              
          end
      end
      function indices_of_active_regions = calculateActiveRegions(obj, point)
        cell_of_regions = obj.full_region.regions;
        cell_of_hyperplanes = obj.full_region.domain.hyperplanes;
        s = size(cell_of_regions,1);
        t = size(cell_of_hyperplanes,2);
        indices_of_active_regions = zeros(s,1);
        hyperplane_info = vertcat(cell_of_regions{:,2});
        for i = 1:s
            valid = 1;
            for j = 1:t
                k = (i-1)*t + j;
                if (hyperplane_info(k,1)>0)
                    
                    if(~testPointInHyperPlane(cell_of_hyperplanes{1,j}, hyperplane_info(k,2),point))
                        valid = 0;
                        break; 
                    end
                end
            end
            if (valid)
                indices_of_active_regions(i,1) = 1;
            end
        end
      end
      function [subdifferential,area,new_array] = calculateSubdifferential(obj,logical_column_of_active_regions, point_array)
        s = size(logical_column_of_active_regions>0,1);
        b = size(obj.full_region.master_regions{1,1}.symbolic_variables,2)*size(obj.full_region.master_regions{1,1}.function_strings,2);
        
        new_array = zeros(s,size(obj.full_region.domain.symbolic_variables,2)*obj.full_region.domain.no_of_components);
        for i = 1:s    
            if (logical_column_of_active_regions >0)
                aPoint = Point(0,0);
                aPoint.setPoint(point_array);
                a = obj.full_region.regions{i,1}.calculateLimitOfDerivative(aPoint);
                prod(a);
                new_array(i,:) = reshape(a,1,numel(a));
            else
                i = i-1;
            end
        end        
        new_array = getMoreRowVectorsByPeturbation(new_array,b+1,0.0001);
        [subdifferential,area] = convhulln(new_array);
      end 
   end
end