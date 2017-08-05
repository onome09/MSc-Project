%Calculates the limit of a Jacobian for a vector function at aPoint
function Limit = calculateLimitOfJacobian(aVectorFunction, variables_string, aPoint)
    variables = createSymbolicVariables(variables_string);
    s = size(aVectorFunction,2);
    v = size(variables,2);
    Limit = zeros(s,v);
    for i = 1:s
        r = jacobian(aVectorFunction{1,i},variables);
        for j = 1:v
            if nargin < 2
                r = limit(r,variables(1,j),0);
            else
                r = limit(r,variables(1,j),aPoint.variables(j,1));
            end
        end
    Limit(i,:) = r;
    end