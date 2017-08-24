function bool = checkIfHyperRectangleSurface(orthogonal_unit_hyperplane_vector)
    bool = 0;
    m = size(orthogonal_unit_hyperplane_vector,1);
    mat = eye(m);
    orthogonal_unit_hyperplane_vector
    for i = 1:m
        sum = norm(abs(orthogonal_unit_hyperplane_vector) - mat(:,i))
        if sum < 0.01
           bool = 1; 
           break 
        end
    end