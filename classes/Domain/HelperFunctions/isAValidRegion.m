function bool = isAValidRegion(binary_combination,hyperplanes,variables)
    bool = 0;
   
    cell_of_eqns_strings = formulateEquations(binary_combination,hyperplanes,variables);
    
    a = solve(cell2sym(cell_of_eqns_strings),variables,'IgnoreProperties', true)
    if (componentsOfStructAreReal(a))        
       bool = 1; 
    end

