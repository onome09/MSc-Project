function bool = isAValidRegion(binary_combination,hyperplanes,variables)
    bool = 0;
    cell_of_eqns = formulateEquations(binary_combination,hyperplanes,variables);
    
    a = solve(cell2sym(cell_of_eqns),variables,'IgnoreProperties', true);
    if (componentsOfStructAreReal(a))        
       bool = 1; 
    end

