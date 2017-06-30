classdef FullRegion
   properties
       domain
       no_of_regions
       regions
   end
   methods
      function obj = FullRegion(aDomain)
         obj.domain = aDomain; 
         obj.no_of_regions = size(aDomain.symbolic_variables,2)^size(aDomain.hyperplanes,2);
         obj = obj.initialiseRegionSize();
         obj = obj.AddAllRegionBoundaries();

      end
      function obj = initialiseRegionSize(obj)
         obj.regions = cell(obj.no_of_regions,2);   
      end
      function obj = AddAllRegionBoundaries(obj)
          C = createAllChoicesMatrix(size(obj.domain.symbolic_variables,2), size(obj.domain.hyperplanes,2));
          obj.regions = addRegionBoundariesToRegionCell(obj.regions, C);
      end
      function obj = insertRegionFunctionInfo(obj, aRegion, index)
          obj.regions{index,1} = aRegion;
      end
      function hyperplane_list_cell_array = showEnclosingHyperPlanesOfARegion(obj, index)
          hyperplane_info = obj.regions{index,2};
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
      function x = getJacobian(obj)
          
        x = convhulln(array_of_jacobians);
      end
   end
end

