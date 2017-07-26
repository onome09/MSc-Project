function bool = isAValidRegion(binary_combination,hyperplanes,variables)
    bool = 1;
    [A,b] = setUpLinearProgram(binary_combination,hyperplanes,variables);
    
    [~,~,exitflag] = linprog(zeros(size(A,2),1),double(A),double(b));
    if(exitflag < 0)
        bool = 0;
    end

