function [new_points_connected,index_of_connecting_points,indices_of_vertices_to_delete,error] = getPointsFromVertex(index,shape_vertices,G,hyperplane_parameters,value,new_points_connected,index_of_connecting_points,indices_of_vertices_to_delete,prev_index)
    dim = size(shape_vertices,2);
    
    error = 0;

    [indices] = findIndicesOfNeighbouringVertices(index,G);
    
    indices(indices==prev_index,:) = [];

    [indices] = findIndicesOfNeighbouringVertices(index,G);
    for i = 1:size(indices_of_vertices_to_delete,1)
        indices(indices==indices_of_vertices_to_delete(i,:),:) = [];
    end
    if size(indices,1) < 1
        error = 1;
       return 
    end
    
    indices_of_vertices_to_delete = [indices_of_vertices_to_delete;index];

    for i = 1:size(indices,1)
       [A,b] = generateLinearSystemForNewPoint(hyperplane_parameters,value,shape_vertices(index,:),shape_vertices(indices(i,1),:));   
       t = det(A);
       if (abs(t) < 0.000000000000000000001) 
          
          error = 1;
          break
       end
       sol = linsolve(A,b);
       
       if (sol(dim+1,:) >= -0.0001 && sol(dim+2,:) >= -0.0001)
            new_points_connected = [new_points_connected;sol(1:dim,:)'];
            index_of_connecting_points = [index_of_connecting_points;indices(i,1)];


       else 
            [A,b] = generateLinearSystemForNewPoint(hyperplane_parameters,-value,shape_vertices(index,:),shape_vertices(indices(i,1),:));   
            t = det(A);
            if (abs(t) < 0.000000000000000000001)

                
                error = 1;
                break
            end
            sol = linsolve(A,b);
            if (sol(dim+1,:) >= -0.0001 && sol(dim+2,:) >= -0.0001)
                new_points_connected = [new_points_connected;sol(1:dim,:)'];
                index_of_connecting_points = [index_of_connecting_points;indices(i,1)];

            else
                if (error >0)
                    
                    break
                end
               [new_points_connected ,index_of_connecting_points,indices_of_vertices_to_delete,error] = getPointsFromVertex(indices(i,1),shape_vertices,G,hyperplane_parameters,value,new_points_connected,index_of_connecting_points,indices_of_vertices_to_delete,index);
                
            end
          
       end
    end

      
    