classdef Region
   properties
      functions
      symbolic_variables
   end
   methods
      function r = Region(string_of_vars, set_of_functions)
          r.symbolic_variables = createSymbolicVariables(string_of_vars);
          r.functions = set_of_functions;
      end
   end
end
