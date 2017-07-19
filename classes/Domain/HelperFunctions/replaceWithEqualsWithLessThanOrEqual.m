function output = replaceWithEqualsWithLessThanOrEqual(input,variables)
   
    r = sym(evalin(symengine,strrep(char(input),'==','<=')));
    output = symfun(r,variables);