function r = calculateLimitOfDerivative(aFunction, variables_string, aPoint)

    variables = createSymbolicVariables(variables_string);
    
    r = jacobian(aFunction,variables);
    for i = 1:size(variables,2) 
        if nargin < 2
            r = limit(r,variables(1,i),0);
        else
            r = limit(r,variables(1,i),aPoint.variables(i,1));
        end
    end