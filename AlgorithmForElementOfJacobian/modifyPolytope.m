function [shape_vertices,G] = modifyPolytope(shape_vertices,G,neighbouring_vertices_indices,new_points_connected,edge_matrix_for_new_points,indices_of_vertices_to_delete)
    shape_vertices = [shape_vertices;new_points_connected];
    shape_vertices(indices_of_vertices_to_delete,:) = [];
    n1 = size(G.Nodes,1);
    
    G = addnode(G,size(new_points_connected,1));
    
    for i = 1:size(neighbouring_vertices_indices,1)
       G = addedge(G,neighbouring_vertices_indices(i,:),n1+i,1);
       
    end
    e = edge_matrix_for_new_points;
    m = size(e,1);
    for i = 1:m
        for j = 1:i
            if (e(i,j) > 0 )
                
                G = addedge(G,n1+i,n1+j,1);
            end
        end        
    end
    G = rmnode(G,indices_of_vertices_to_delete);
    %G.Edges