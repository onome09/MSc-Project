function [domain_with_regions,info_on_each_region] = initialiseDomainWithRegions(symbolic_variables,hyperplanes)
    s = size(hyperplanes,2);
    t = size(symbolic_variables,2);
    
    no_of_regions = noOfRegions(t,s);
    domain_with_regions = cell(1,no_of_regions);
    info_on_each_region = cell(1,no_of_regions);
    for i = 1:no_of_regions
        info_on_each_region{1,i} = zeros(s,2);            
    end        