function output = replaceWithEqualsWithGreaterThanOrEqual(input,variables)
    
    r = sym(evalin(symengine,strrep(char(input),'==','>=')));
    output = symfun(r,variables);
 
 