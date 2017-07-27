function bool = isAValidRegion(binary_combination,hyperplanes,variables)
    bool = 1;
    [A,b] = setUpLinearProgram(binary_combination,hyperplanes,variables);
    for i = 1:size(b,1)
        if (binary_combination(1,i)>0)
            b(i,1) = b(i,1)-0.00001; 
        else
               b(i,1) = b(i,1)+0.00001; 
        end        
    end
    [~,~,exitflag] = linprog(zeros(size(A,2),1),double(A),double(b));
    if(exitflag < 0)
        bool = 0;
    end

