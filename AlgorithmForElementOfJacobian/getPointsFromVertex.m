function [new_points_connected,index_of_connecting_points,indices_of_vertices_to_delete] = getPointsFromVertex(index,shape_vertices,G,hyperplane_parameters,value,new_points_connected,index_of_connecting_points,indices_of_vertices_to_delete,prev_index)
    dim = size(shape_vertices,2);
    [indices] = findIndicesOfNeighbouringVertices(index,G);
    indices(indices==prev_index,:) = [];
    if size(indices,1) < 1
       return 
    end
    disp(indices)
    indices_of_vertices_to_delete = [indices_of_vertices_to_delete;index];
    bool = 0;
    for i = 1:size(indices,1)
       [A,b] = generateLinearSystemForNewPoint(hyperplane_parameters,value,shape_vertices(index,:),shape_vertices(indices(i,1),:));   
       sol = linsolve(A,b); 
       
       if (sol(dim+1,:) >= -0.0001 && sol(dim+2,:) >= -0.0001)
            new_points_connected = [new_points_connected;sol(1:dim,:)'];
            index_of_connecting_points = [index_of_connecting_points;indices(i,1)];
            bool = 1;

       else 
            [A,b] = generateLinearSystemForNewPoint(hyperplane_parameters,-value,shape_vertices(index,:),shape_vertices(indices(i,1),:));   
            sol = linsolve(A,b);
            if (sol(dim+1,:) >= -0.0001 && sol(dim+2,:) >= -0.0001)
                new_points_connected = [new_points_connected;sol(1:dim,:)'];
                index_of_connecting_points = [index_of_connecting_points;indices(i,1)];
                bool = 1;
            else
               [new_points_connected ,index_of_connecting_points,indices_of_vertices_to_delete] = getPointsFromVertex(indices(i,1),shape_vertices,G,hyperplane_parameters,value,new_points_connected,index_of_connecting_points,indices_of_vertices_to_delete,index);
            end
          
       end
    end
    if bool<0
         
    end
      
    