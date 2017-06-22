classdef ObjFunction
   properties
      symbolic_variables
      no_of_components
      regions
   end
   methods
      function obj = ObjFunction(string_of_vars, no_of_components)
         obj.symbolic_variables = createSymbolicVariables(string_of_vars);
         obj.no_of_components = no_of_components;
         obj.regions = cell(0);
      end 
      function obj = addRegion(obj, aRegion)
         obj.regions = addMoreCellsToRowOrColumnArray(obj.region, 1, 2);
         obj.regions{1, size(obj.regions,2)} = aRegion;
      end
      function checkForOverlap()
         
      end
      function checkAllDomainCovered()
         
      end
      
      function getJacobian()
         
      end
   end
end