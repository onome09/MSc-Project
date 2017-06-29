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
      function obj = AddRegion(obj, aRegion, index)
          obj.regions{index,1} = aRegion;
      end
      function hyperplane_list_cell_array = showEnclosingHyperPlanesOfARegion(obj, index)
          hyper_plane_info = obj.regions{index,2};
          hyperplane_list_cell_array = cell(sum(hyper_plane_info(:,1)),2);
      end
   end
end
