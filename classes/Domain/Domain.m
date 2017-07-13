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
      function [obj,test] = calculateRegions(obj)
        s = size(obj.hyperplanes,2);
        obj.no_of_regions = 40;
        obj.regions = cell(obj.no_of_regions,3);
        for i = 1:obj.no_of_regions
            obj.regions{i,2} = zeros(s,2);
        end
        t = size(obj.symbolic_variables,2);
        C = createAllChoicesMatrix(t, s);
        

        region_counter = 1;
        for i = 1:size(C,1)
            eqns = cell(1,t);
            eqns = copyIndexedToCell(eqns, C(i,:), obj.hyperplanes);
            eqns
            if (componentsOfStructAreReal(solve(cell2sym(eqns),obj.symbolic_variables)))
                b = createBinaryCounterMatrix(t);
                if (region_counter < 2)
                    for j = 1:size(b,1)
                        obj.regions{region_counter,2} = inputRegionInfo(obj.regions{region_counter,2}, C(i,:),b(j,:));
                        region_counter = region_counter + 1;
                    end
                    test = obj.regions;
                else
                    c = createBinaryCounterMatrix(t-1);
                    u = region_counter-1;
                    for j = 1:u
                        for k = 1:size(c,1)
                            if (compareAllButLast(obj.regions{u,2}, C(i,:), c(k,:)))
                               obj.regions{j,2}(C(i,end),1) = 1;
                               obj.regions{j,2}(C(i,end),2) = 0;
                               obj.regions{region_counter,2} = obj.regions{j,2};
                               obj.regions{region_counter,2}(C(i,end),2) = 1;
                               region_counter = region_counter+1;
                               break
                            end
                        end
                    end
                end
                                
            else
                
            end
        end
        obj.no_of_regions = 16;
        obj.regions(region_counter:end,:) = [];
      end
   end
end