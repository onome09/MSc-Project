%Tests all hyperplane combinations and finds out which combinations form
%valid regions
function  [passed_combinations] = testHyperPlaneFunctions(hyperplane_functions,variables)
    [counter, ~, passed_combinations, all_binary_combinations] = initialiseParameters(hyperplane_functions);

    for i = 1:size(all_binary_combinations,1)        
        if (isAValidRegion(all_binary_combinations(i,:),hyperplane_functions,variables))
            passed_combinations(counter,:) = all_binary_combinations(i,:);
            counter = counter + 1 ;      
        end
    end   
    
    passed_combinations(counter:end,:)= [];
