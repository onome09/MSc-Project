function subgradient_step = calculateSubgradientStep(array_of_gradients)

    coeffs = randomarray(size(array_of_gradients,1), 1);
    
    x = repmat(coeffs,1,size(array_of_gradients,2));
    subgradient_step = sum(x.*array_of_gradients,1);
    