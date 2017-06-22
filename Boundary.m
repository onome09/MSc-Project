classdef Boundary
   properties
      symbolic_boundary
      symbolic_variables
   end
   methods
      function obj = Boundary(variable_string, boundary_string)
          obj.symbolic_boundary = createSymbolicBoundary(variable_string, boundary_string);
          obj.symbolic_variables = varString2Array(variable_string);
      end
   end
end