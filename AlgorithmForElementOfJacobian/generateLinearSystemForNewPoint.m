function [A,b] = generateLinearSystemForNewPoint(hyperplane_parameters_of_new_point,value_of_hyper_plane_equation,vertex1,vertex2)

    dim = size(vertex1,2);    
  
    A = zeros(2+dim,2+dim);
    b = zeros(2+dim,1);
    b(end,1) = 1;
    A(1,1:dim) = hyperplane_parameters_of_new_point';
    b(1,1) = value_of_hyper_plane_equation;
    A(2:dim+1,1:dim) = -1*eye(dim);
    A(end,dim+1:end) = ones(1,2);
    A(2:end-1,dim+1:end) = [vertex1',vertex2'];

    