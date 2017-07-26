function [A,b] = setUpLinearProgram(binary_combination,hyperplanes,variables)
    s = size(binary_combination,2);
    equations = cell(1,s);    
    for i = 1:s
        equations{1,i} = createEquation(hyperplanes{1,i},binary_combination(1,i),variables);
        
    end
    [A, b] = equationsToMatrix(equations, variables);