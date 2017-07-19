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
      function [obj] = calculateRegions(obj)
        s = size(obj.hyperplanes,2);
        t = size(obj.symbolic_variables,2);
        obj.no_of_regions = noOfRegions(t,s);
        obj.regions = cell(obj.no_of_regions,4);
        for i = 1:obj.no_of_regions
            obj.regions{i,2} = zeros(s,2);            
        end        
        
        hyperplane_functions = cell(s,1);
        for i = 1:s
           hyperplane_functions{i,1} = obj.hyperplanes{1,i}.symbolic_hyperplane_function;  
        end
        obj.regions = magic(obj.regions, hyperplane_functions,obj.symbolic_variables);        
      end
   end
end