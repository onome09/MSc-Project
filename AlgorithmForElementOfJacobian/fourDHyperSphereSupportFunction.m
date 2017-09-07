function [v] = fourDHyperSphereSupportFunction(unit_vector_orthogonal_to_hyper_plane)

    f = 1;
    a = f * unit_vector_orthogonal_to_hyper_plane;    
    v = (a'*a)^0.5;
    