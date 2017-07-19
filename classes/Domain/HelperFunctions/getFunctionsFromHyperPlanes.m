function hyperplane_functions = getFunctionsFromHyperPlanes(hyperplanes)

h = size(hyperplanes,2);
hyperplane_functions = cell(1, h);
for i = 1:h
    hyperplanes{1,i}
    hyperplane_functions{1,i} = hyperplanes{1,i}.symbolic_hyperplane_function;
end