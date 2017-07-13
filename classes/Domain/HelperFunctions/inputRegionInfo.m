function output = inputRegionInfo(input, choices,inequality)
    for i = 1:size(choices,2)    
        input(choices(1,i),1) = 1;
        input(choices(1,i),2) = inequality(1,i);
    end
    output = input;