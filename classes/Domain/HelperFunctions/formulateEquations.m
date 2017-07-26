function cell_of_eqns_strings = formulateEquations(choice,hyperplanes,variables)
    n = size(choice,2);
    cell_of_eqns_strings = cell(1,n);
    for i = 1:n
        if (choice(1,i) > 0)
            hyperplanes{1,i} = replaceWithEqualsWithGreaterThanOrEqual(hyperplanes{1,i},variables);
        else
            hyperplanes{1,i} = replaceWithEqualsWithLessThanOrEqual(hyperplanes{1,i},variables);
        end
        char(hyperplanes{1,i})
        cell_of_eqns_strings{1,i} = char(hyperplanes{1,i});
    
    end

    