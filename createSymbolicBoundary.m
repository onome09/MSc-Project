function [boundary_sym] = createSymbolicBoundary(variables,function_string)
%converts from function from string format to symbolic format with the
%variables specified

%makes the symbolic variables the function has from the variables string
symbolic_variables = createSymbolicVariables(variables);

%evaluates function from function string 
boundary_sym = evalin(symengine, function_string);




if (~checkNoExtraVariables(symbolic_variables,boundary_sym))
    disp('some extra variables not defined')
end