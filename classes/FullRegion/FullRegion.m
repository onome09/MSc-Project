classdef FullRegion
   properties
       domain
       master_regions
       
   end
   methods
      function obj = FullRegion(aDomain)
         obj.domain = aDomain; 
         r = size(aDomain.hyperplanes,2);   
         
         obj.master_regions = cell(0);
         
      end
      
      
      function obj = insertRegionFunctionInfo(obj, aRegion, index)
          obj.regions{index,1} = aRegion;
          master_region_found = 1;
          for i = 1:size(obj.master_regions,2)
            if (obj.master_regions{1,i}.equals(aRegion))
               master_region_found = 0;
               obj.regions{index,3} = i;
               break;
            end
          end
          if (master_region_found > 0)
              obj = obj.addMasterRegion(aRegion);
              obj.domain.regions{index,3} = size(obj.master_regions,2);
          end
      end
      function obj = addMasterRegion(obj, aRegion)
          obj.master_regions = addToCellRow(obj.master_regions, aRegion);
      end
      function hyperplane_list_cell_array = showEnclosingHyperPlanesOfARegion(obj, index)
          hyperplane_info = obj.domain.egions{index,2};
          r = find(hyperplane_info(:,1)==1);
          hyperplane_list_cell_array = cell(sum(hyperplane_info(:,1)),2);
          for i = 1:sum(hyperplane_info(:,1))
                hyperplane_list_cell_array{i,1} = char(obj.domain.hyperplanes{1,r(i,1)}.symbolic_hyperplane_function);
                if (hyperplane_info(r(i,1),2) >0)
                    hyperplane_list_cell_array{i,2} = 'greater than';
                else
                    hyperplane_list_cell_array{i,2} = 'less than';
                end        
          end
          displayCellArray(hyperplane_list_cell_array)
      end
      function [points,area] = getJacobian(obj)
        a = size(obj.master_regions{1,1}.symbolic_variables,2)*size(obj.master_regions{1,1}.function_strings,2);
        array_of_jacobians = zeros(size(obj.master_regions,2),a);
        for i = 1:size(obj.master_regions,2)
            array_of_jacobians(i,:) = reshape(double(obj.master_regions{1,i}.calculateLimitOfDerivative),1,a);
        end
        
        array_of_jacobians = getMoreRowVectorsByPeturbation(array_of_jacobians,a+1,0.0001);
        [points,area] = convhulln(array_of_jacobians);
      end
      
   end
end

