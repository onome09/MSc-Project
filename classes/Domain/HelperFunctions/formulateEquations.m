function cell_of_eqns = formulateEquations(choice,hyperplanes,variables)
    n = size(choice,2);
    cell_of_eqns = cell(1,n);
    for i = 1:n
        if (choice(1,i) > 0)
            hyperplanes{i,1} = replaceWithEqualsWithGreaterThanOrEqual(hyperplanes{i,1},variables);
        else
            hyperplanes{i,1} = replaceWithEqualsWithLessThanOrEqual(hyperplanes{i,1},variables);
        end
        cell_of_eqns{1,i} = hyperplanes{i,1};
    
    end