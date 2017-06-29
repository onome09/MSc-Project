function output = populatePossibleRegionsFromActiveHyperplanes(first, last, input, choice, max_choices)
    b = createBinaryCounterMatrix(size(choice,2));
    k = 1;    
    for i = first:last
       input{i,2} = zeros(max_choices, 2);       
       input{i,2} = initialiseRegionBoundary(input{i,2}, choice, b(k,:));
       k = k+1;
    end    
    output = input;
