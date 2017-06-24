classdef Function
   properties
      symbolic_function
      symbolic_variables
   end
   methods
      function obj = Function(string_of_vars, function_string)
         obj.symbolic_function =createSymbolicFunction(string_of_vars,function_string);
         obj.symbolic_variables = varString2Array(string_of_vars);
      end      
   end
end