%calculates the subgradient step by taking the avarage of all the
%subgradients
function subgradient_step = calculateSubgradientStep(array_of_gradients)
    coeffs = (1/size(array_of_gradients,1)*ones(size(array_of_gradients,1), 1));   
    x = repmat(coeffs,1,size(array_of_gradients,2));
    subgradient_step = -sum(x.*array_of_gradients,1)';
    