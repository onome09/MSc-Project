function flattened_function_string = createFlattenedFunctionString(cell_of_variables,cell_of_flattened_variables,cell_of_functions,dimensions)
    s = '';
    m = size(cell_of_functions,2);
    for i = 1:m
        if (i > 1)
           s = strcat(s,'+');
        end
        function_string = char(cell_of_functions{1,i});
        
        for j = 1:dimensions
            [cell_of_variables{1,j},cell_of_flattened_variables{1,(j-1)*m+i}]
            function_string = strrep(function_string,cell_of_variables{1,j},cell_of_flattened_variables{1,(j-1)*m+i}); 
        end
        if ((function_string(1,1) == '-' || function_string(1,1) == '*'|| function_string(1,1) == '/') && s(end)=='+')
            s(end) = [];
        end    
        s = strcat(s,function_string);        
    end
    flattened_function_string = s