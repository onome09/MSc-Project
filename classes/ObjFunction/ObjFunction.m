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
          if (obj.full_region.domain.no_of_components > 1)
             return; 
          end
          xk = x0;
          iteration = 0;
          while (stopping_criterion)
              logical_column_of_active_regions = calculateActiveRegions( xk);
              subdifferential = calculateSubdifferential(logical_column_of_active_regions, xk);
              subgradient_step = calculateSubgradientStep(subdifferential);
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
   end
end