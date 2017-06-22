classdef Region
   properties
      boundaries
      functions
      symbolic_variables
   end
   methods
      function r = Region(string_of_vars, full_boundaries, set_of_functions)
          r.symbolic_variables = createSymbolicVariables(string_of_vars);
          r.boundaries = full_boundaries;
          r.functions = set_of_functions;
      end
   end
end
