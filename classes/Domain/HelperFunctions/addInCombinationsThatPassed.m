function [regions] = addInCombinationsThatPassed(regions, passed_combinations)
    for i = 1:size(passed_combinations,1)
       regions{i,2}(:,1) = ones(size(regions{i,2}(:,1)));       
       regions{i,2}(:,2) = passed_combinations(i,:)';
    end
