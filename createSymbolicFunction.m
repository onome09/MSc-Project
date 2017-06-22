function [function_sym] = createSymbolicFunction(variables,function_string)
%converts from function from string format to symbolic format with the
%variables specified

%makes the symbolic variables the function has from the variables string
symbolic_variables = createSymbolicVariables(variables);

%evaluates function from function string 
function_to_use = evalin(symengine, function_string);

% makes the symbolic function to use
function_sym = symfun(function_to_use, symbolic_variables);


if (~checkNoExtraVariables(symbolic_variables,function_sym))
    disp('some extra variables not defined')
end