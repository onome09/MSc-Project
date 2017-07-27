function symbolic_variables = createSymbolicVariables(variable_string)
%creates symbolic variables from a string of variables separated by spaces

array_of_variables = varString2Array(variable_string);

%syms(array_of_variables);

symbolic_variables = sym(array_of_variables);


