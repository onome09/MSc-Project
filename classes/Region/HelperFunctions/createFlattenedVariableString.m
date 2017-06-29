function variable_string = createFlattenedVariableString(symbolic_variables, no_of_functions)
    variable_string = '';
    for i = 1:size(symbolic_variables,2)
        if (i > 1)
            variable_string = strcat(variable_string,',');   
        end
    c = sym(char(symbolic_variables(1,i)), [1 no_of_functions]);
    variable_string = strcat(variable_string,convertSymbolicArrayToStringArray(c));
    end
