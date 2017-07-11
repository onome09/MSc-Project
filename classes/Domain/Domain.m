classdef Domain
   properties
      symbolic_variables
      no_of_components
      hyperplanes
      no_of_regions
      regions
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
      function obj = calculateRegions(obj)
        s = size(obj.hyperplanes,2);
        obj.no_of_regions = s^2 + s + 2;
        obj.regions = cell(obj.no_of_regions,3);
        t = size(obj.symbolic_variables,2);
        C = createAllChoicesMatrix(t, s);
        for i = 1:size(C,1)
            eqns = cell(1,t);
            eqns = copyIndexedToCell(eqns, C(i,:), obj.hyperplanes);
            if (componentsOfStructAreReal(solve(cell2sym(eqns),obj.symbolic_variables)))
                
            else
                
            end
        end
      end
   end
end