classdef FullFunction
   properties
      Functions
      function_strings
      Components
   end
   methods
      function obj = FullFunction()
         obj.Functions = cell(0);
         obj.function_strings = cell(0);
         obj.Components = 0;
      end 
      function obj = addFunction(obj, aFunction)
          obj.Functions = addMoreCellsToRowOrColumnArray(obj.Functions, 1, 2);
          obj.function_strings = addMoreCellsToRowOrColumnArray(obj.function_strings, 1, 2);
          obj.Functions{1, size(obj.Functions,2)} = aFunction.symbolic_function;
          obj.function_strings{1, size(obj.Functions,2)} = aFunction.function_string;
          obj.Components = obj.Components + 1;
      end
   end
end