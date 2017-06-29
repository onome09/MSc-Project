classdef HyperPlane
   properties
      symbolic_hyperplane_function
      symbolic_variables
   end
   methods
      function obj = HyperPlane(string_of_vars, function_string)
         obj.symbolic_hyperplane_function = createSymbolicFunction(string_of_vars,function_string);
         obj.symbolic_variables = varString2Array(string_of_vars);
      end      
   end
end