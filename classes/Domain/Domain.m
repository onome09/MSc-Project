classdef Domain
   properties
      symbolic_variables
      no_of_components
      hyperplanes
   end
   methods
      function r = Domain(variable_string, no_of_compnents)
          r.symbolic_variables = createSymbolicVariables(variable_string);
          r.no_of_components = no_of_compnents;
          r.hyperplanes = cell(0);
      end
      
      function obj = addHyperplane(obj, aHyperPlane)
         obj.hyperplanes = addToCellRow(obj.hyperplanes ,aHyperPlane);
         
      end
   end
end