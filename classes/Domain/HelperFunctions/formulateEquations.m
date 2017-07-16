function cell_of_eqns = formulateEquations(choice,hyperplanes)
    n = size(choice,2);
    cell_of_eqns = cell(1,n);
    for i = 1:n
        cell_of_eqns{1,i} = hyperplanes{i,1};
    end