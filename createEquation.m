function equation2 = createEquation(hyperplane,bool,variables)
    if(bool)
        equation = '-1*(';
        equation = strcat(equation,char(hyperplane));
        equation = insertBefore(equation, '==',')');
        equation = insertAfter(equation,'==','-1*(');
        equation = strcat(equation,')');
    else
        equation2 = hyperplane;
        return
    end
        equation = evalin(symengine, equation);
        equation2 = symfun(equation,variables);
        