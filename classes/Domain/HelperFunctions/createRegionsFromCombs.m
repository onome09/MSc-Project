%looks to check each combination of hyperplanes up to max dimension

function [regions,region_counter] = createRegionsFromCombs(regions,region_counter,combs,max_dim,hyperplanes,variables)
    for i = 1:max_dim
        
       bool = 1;
       for j = 1:size(combs{i,1},1)
           u = combs{i,1}(j,:)
           if (~(prod(size(combs{i,1}(j,:))) == 0))
           cell_of_eqns = formulateEquations(combs{i,1}(j,:),hyperplanes);
           if (componentsOfStructAreReal(solve(cell2sym(cell_of_eqns),variables)))
               bool = 0;
               
               [regions,region_counter] = createRegionsFromAValidComb(regions,region_counter,combs{i,1}(j,:),i); 
               
           else
               
           end
           
           end
       end
       if (~bool)
           break
       end
    end