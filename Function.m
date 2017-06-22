classdef Function
   properties
      symbolic_function
   end
   methods
      function obj = Function(string_of_vars, function_string)
         obj.symbolic_function =createSymbolicFunction(string_of_vars,function_string);
      end      
   end
end