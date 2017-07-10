function bool = testPointInHyperPlane(aHyperPlane, lessorgreater,point)
    variables = aHyperPlane.symbolic_variables;
    symfunction = aHyperPlane.symbolic_hyperplane_function;
    
    
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
        vars = strcat(vars,variables{1,i});
    end
    symfunction = createSymbolicFunction(vars,newStr);
    
    for i = 1:size(variables,2)
        symfunction = subs(symfunction,variables{1,i},point(i,1));
    end
    
    bool = logical(symfunction);