function output = initialiseRegionBoundary(input, choice, binary_choice)
    input(choice',1) = 1;
    k = 1;
    i = 1;
    while k < size(binary_choice,2) + 1
       input(1,1);
       if (input(i,1) ==1)
           input(i,2) = binary_choice(1,k);
           k = k+1;
       end
       i=i+1;
    end
    output = input;