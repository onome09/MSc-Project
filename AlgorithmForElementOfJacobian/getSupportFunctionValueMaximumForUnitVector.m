%finds the supremum of v.u where u is a point in the convex set
function [r,f] = getSupportFunctionValueMaximumForUnitVector(unit_vector_orthogonal_to_hyper_plane,vertices_of_convex_set)
    [A,b] = vert2con(vertices_of_convex_set);
    
    [r] = linprog( -unit_vector_orthogonal_to_hyper_plane' , A , b);

   f =  unit_vector_orthogonal_to_hyper_plane'*r;

