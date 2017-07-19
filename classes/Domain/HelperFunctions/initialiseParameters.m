function [counter, no_of_hyperplanes, passed_combinations, all_binary_combinations] = initialiseParameters(hyperplane_functions)


counter = 1;

no_of_hyperplanes = size(hyperplane_functions,1);

all_binary_combinations = createBinaryCounterMatrix(no_of_hyperplanes);
passed_combinations = zeros(size(all_binary_combinations,1), no_of_hyperplanes);