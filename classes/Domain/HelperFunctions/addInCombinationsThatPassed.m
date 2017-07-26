%This function adds in the combinations of hyperplanes that form valid
%regions

function [region_info_cell] = addInCombinationsThatPassed(region_info_cell, passed_combinations)
    s = size(region_info_cell{1,1}(:,1));
    for i = 1:size(passed_combinations,1)
       region_info_cell{1,i}(:,1) = ones(s);     
       passed_combinations(i,:)'
       region_info_cell{1,i}(:,2) = passed_combinations(i,:)';
    end
