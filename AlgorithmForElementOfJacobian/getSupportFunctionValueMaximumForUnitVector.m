%finds the the value of the support function for a unit vector
function [v] = getSupportFunctionValueMaximumForUnitVector(unit_vector_orthogonal_to_hyper_plane)
    
    f = 1;
    a = f * unit_vector_orthogonal_to_hyper_plane;    
    v = (a'*a);
