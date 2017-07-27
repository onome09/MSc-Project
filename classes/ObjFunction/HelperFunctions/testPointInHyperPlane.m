function bool = testPointInHyperPlane(aHyperPlane_symbolic_function, variables_string, lessorgreater,point)
    symfunction = aHyperPlane_symbolic_function;
    variables = createSymbolicVariables(variables_string);
    
    if (lessorgreater)
        newStr = strrep(char(symfunction),'==','>=');
    else
        newStr = strrep(char(symfunction),'==','<=');
    end
    vars = '';
    for i = 1:size(variables,2)
        if (i>1)
            vars = strcat(vars,',');
        end
       
        vars = strcat(vars,variables(1,i));
    end
    symfunction = createSymbolicFunction(vars,newStr);
    
    for i = 1:size(variables,2)
        symfunction = subs(symfunction,variables(1,i),point(i,1));
    end
    
    bool = logical(symfunction);