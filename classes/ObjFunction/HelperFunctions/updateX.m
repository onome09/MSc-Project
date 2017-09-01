function [newX,learning_rate] = updateX(oldX,region_functions , newton_step,learning_rate,symbolic_variables,newton)
    if ~iscell(region_functions)
        region_functions = {region_functions};
    end
    s = size(region_functions,2);
    bool = 0;
    f1 = zeros(s,1);
    for i = 1:s
        f1(i,:) = testRegionFunction(oldX,region_functions{1,i},symbolic_variables) ;       
    end
    f = zeros(s,1);
    while (~bool)
        bool = 1;
        newX = oldX + learning_rate*newton_step;
        for i = 1:s
            f(i,:) = testRegionFunction(newX,region_functions{1,i},symbolic_variables);
            
            if (newton)
                f(i,:) = -1;
                %f(i,:) = (f(i,:)-f1(i,:))/f1(i,:);
            else
                f(i,:) = (f(i,:)-f1(i,:));
                if (f(i,:)<0)
                    f(i,:) = 0;
                end
            end
        end
        
            if (sum(f) > 0)
                bool = 0;      
            end
        
        learning_rate = learning_rate*0.5;
    end
    learning_rate = learning_rate / 0.5;
    

        