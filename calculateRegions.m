function [domain_with_regions,info_on_each_region] = calculateRegions(symbolic_variables,hyperplanes)
        [domain_with_regions,info_on_each_region] = initialiseDomainWithRegions(symbolic_variables,hyperplanes);
        [info_on_each_region] = getInfoOnRegions(info_on_each_region,hyperplanes,symbolic_variables); 
        domain_with_regions = domain_with_regions(:,1:size(info_on_each_region,2));