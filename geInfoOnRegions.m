%This function populates the reigion info cell with info on how the
%hyperplanes are when they define a region. Each element of the region cell
%gives infro about a region and is a nx2 matrix where n is the no of
%hyperplanes. a 1 in the first column means the hypperplane is active then
%a zero in the saecond column means the region is less than the hyperplane
%or 1 means more than the value in the hyperplane rhs of the hyperplane
%equation
function region_info_cell = getInfoOnRegions(region_info_cell,  hyperplanes, variables)       
    [passed_combinations] = testAllHyperPlaneCombinations(hyperplanes,variables);
    [regions] = addInCombinationsThatPassed(regions, passed_combinations);
    
