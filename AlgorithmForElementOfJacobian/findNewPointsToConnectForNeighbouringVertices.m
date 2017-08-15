%finds the new points that the neighbouring vertices will be connected
%after shaving
function [new_points_connected] = findNewPointsToConnectForNeighbouringVertices(hyperplane_parameters,value,starting_vertex,neighbouring_vertices)
    dim = size(neighbouring_vertices,2);
    num = size(neighbouring_vertices,1);
    new_points_connected = zeros(dim,dim);
    neighbouring_vertices
    for i = 1:num
       [A,b] = generateLinearSystemForNewPoint(hyperplane_parameters,value,starting_vertex,neighbouring_vertices(i,:))
       
       sol = linsolve(A,b)
       if (sol(dim+1,:) <-0.0001 || sol(dim+2,:) <-0.0001)
           [A,b] = generateLinearSystemForNewPoint(hyperplane_parameters,-value,starting_vertex,neighbouring_vertices(i,:));
       sol = linsolve(A,b)
       end
       A*sol
       new_points_connected(i,:) = sol(1:dim,:)';         
    end