%This function populates the reigion info cell with info on how the
%hyperplanes are when they define a region
function region_info_cell = getInfoOnRegions(region_info_cell,  hyperplanes, variables)       
    [passed_combinations] = testAllHyperPlaneCombinations(hyperplanes,variables);
    [regions] = addInCombinationsThatPassed(regions, passed_combinations);
    
