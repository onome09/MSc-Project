%This function adds in the combinations of hyperplanes that form valid
%regions

function [region_info_cell] = addInCombinationsThatPassed(region_info_cell,passed_combinations)
    s = size(passed_combinations,1);
    h = size(passed_combinations,2);
    count = 0;
    for i = 1:s
       region_info_cell{1,i}(:,1) = ones(h,1);     
       region_info_cell{1,i}(:,2) = passed_combinations(i,:)';
       count = count+1;
    end
    region_info_cell = region_info_cell(1,1:count);
