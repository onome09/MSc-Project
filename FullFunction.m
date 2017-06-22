classdef FullFunction
   properties
      Functions
      Components
   end
   methods
      function obj = FullFunction()
         obj.Functions = cell(0);
      end 
      function obj = addFunction(obj, aFunction)
          obj.Functions = addMoreCellsToRowOrColumnArray(obj.Functions, 1, 2);
          obj.Functions{1, size(obj.Functions,2)} = aFunction;
      end
   end
end