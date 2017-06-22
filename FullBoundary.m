classdef FullBoundary
   properties
      Boundaries
   end
   methods
      function obj = FullBoundary()
         obj.Boundaries = cell(0);
      end 
      function obj = addBoundary(obj, aBoundary)
          obj.Boundaries = addMoreCellsToRowOrColumnArray(obj.Boundaries, 1, 2);
          obj.Boundaries{1, size(obj.Boundaries,2)} = aBoundary;
      end
      function obj = checkAllVariablesAreBounded(obj)
          
      end
   end
end