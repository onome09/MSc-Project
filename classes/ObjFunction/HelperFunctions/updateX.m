function [newX,learning_rate] = updateX(oldX,region_functions , newton_step,learning_rate,symbolic_variables)
    s = size(region_functions,2);
    bool = 0;
    f1 = zeros(s,1);
    for i = 1:s
        f1(i,:) = testRegionFunction(oldX,region_functions{1,i},symbolic_variables);        
    end
    
    f = zeros(s,1);
    while (~bool)
        bool = 1;
        newX = oldX + learning_rate*newton_step;
        for i = 1:s
            f(i,:) = testRegionFunction(newX,region_functions{1,i},symbolic_variables);
            if (f(i,:) > f1(i,:))
               bool = 0;
               break
            end
        end
        learning_rate = learning_rate*0.9;
    end
    learning_rate = learning_rate / 0.9;
    

        