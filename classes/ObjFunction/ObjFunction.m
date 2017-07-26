%This class defines an objective function and takes in a fully defined
%piecewise differentiable region or continuously differentiable region. If
%the region is piecewise differentiable then the newton method cannot be
%used
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
          [xk,iteration,jacobian,hessian,subbed_jacobian] = initialiseForNewtonMethod(x0,aRegion);
          
          while (norm(subbed_jacobian)>stopping_criterion)
            subbed_jacobian = subXIntoJacobian(jacobian,aRegion.symbolic_variables,xk);
            subbed_hessian = subXIntoHessian(hessian,aRegion.symbolic_variables,xk);
            newton_step = calculateNewtonStep(subbed_jacobian,subbed_hessian);
            xk = updateX(xk, newton_step,learning_rate);
            iteration = iteration + 1;
          end
      end
      
      function [xk,iteration]= optimiseSubgradientDescentMethod(obj,x0,learning_rate,stopping_criterion)
          xk = x0;
          iteration = 0;
          while (1)              
              logical_column_of_active_regions = obj.calculateActiveRegions(xk);
              logical_column_of_active_regions = obj.getOnlyMasterRegions(logical_column_of_active_regions);             
              [~,~,array] = obj.calculateSubdifferential(logical_column_of_active_regions, xk);             
              subgradient_step = calculateSubgradientStep(array);
              if (norm(subgradient_step)<stopping_criterion)
                  break 
              end              
              xk = updateX(xk, subgradient_step,learning_rate);
              iteration = iteration + 1;              
          end
      end
      function indices_of_active_regions = calculateActiveRegions(obj, point)
        cell_of_regions = obj.full_region.domain.regions;
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
        s = sum(logical_column_of_active_regions,1);
        b = size(obj.full_region.master_regions{1,1}.symbolic_variables,2)*size(obj.full_region.master_regions{1,1}.function_strings,2);
        
        new_array = zeros(s,size(obj.full_region.domain.symbolic_variables,2)*obj.full_region.domain.no_of_components);
        count = 1;

        for i = 1:(size(logical_column_of_active_regions,1))   
            if (logical_column_of_active_regions(i,1) >0)
                aPoint = Point(0,0);
                aPoint = aPoint.setPoint(point_array);
                a = obj.full_region.regions{i,1}.calculateLimitOfDerivative(aPoint);
                prod(a);
                new_array(count,:) = reshape(a,1,numel(a));
                count = count + 1;
            else
                
            end
        end 
        if (s < 2)
            subdifferential = 0;
            area = 0;
            return
        end
        new_array = getMoreRowVectorsByPeturbation(new_array,b+1,0.0001);
        [subdifferential,area] = convhulln(new_array);
      end 
      function logical_column_of_active_regions = getOnlyMasterRegions(obj,logical_column_of_active_regions)
          l = logical_column_of_active_regions;
          s = zeros(size(l));
          for i = 1:size(l,1)
             if (l(i,:)>0 && isempty(find(s==obj.full_region.region_to_master_vector(i,:),1)))
                 l(i,:) = 1;
                 s(i,:) = obj.full_region.region_to_master_vector(i,:);
             else
                 l(i,:) = 0;
             end    
          end
            logical_column_of_active_regions = l;
      end
      function output = testFunction(obj,xk,logical_column_of_active_regions)
        variables = obj.full_region.domain.symbolic_variables;
        i = find(logical_column_of_active_regions==1,1);

        symfunction = obj.full_region.regions{i,1}.functions{1,1};
        

    
    for i = 1:size(variables,2)
        symfunction = subs(symfunction,variables(1,i),xk(i,1));
    end
        output = eval(symfunction);
      end
   end
end