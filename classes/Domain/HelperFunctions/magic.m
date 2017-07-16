function regions = magic(regions, combs, hyperplanes, variables)       
h = size(hyperplanes,1);    
v = size(variables,2);    
region_counter = 1;
for i = 1:h
    
    [combinations_to_test,max_dim] = findCombsEndingInIndex(combs,i);
    
    [regions,region_counter] = createRegionsFromCombs(regions,region_counter,combinations_to_test,max_dim,hyperplanes,variables);
    
end