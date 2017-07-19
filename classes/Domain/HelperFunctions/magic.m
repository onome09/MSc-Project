function regions = magic(regions,  hyperplanes, variables)       


[passed_combinations] = testAllHyperPlaneCombinations(hyperplanes,variables);
[regions] = addInCombinationsThatPassed(regions, passed_combinations);
    
