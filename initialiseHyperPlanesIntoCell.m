function hyperplanes = initialiseHyperPlanesIntoCell(variables_string,hyperplane_functions)
    s = size(hyperplane_functions,2);
    hyperplanes = cell(1,s);
    for i = 1:s
        hyperplanes{1,i} = createSymbolicFunction(variables_string,hyperplane_functions{1,i});
    end