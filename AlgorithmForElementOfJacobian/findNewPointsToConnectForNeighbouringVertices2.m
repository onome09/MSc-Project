function [new_points_connected,index_of_connecting_points,indices_of_vertices_to_delete,error] = findNewPointsToConnectForNeighbouringVertices2(orthogonal_unit_hyperplane_vector,value_of_equation,index,shape_vertices,G)
    
     
[new_points_connected,index_of_connecting_points,indices_of_vertices_to_delete,error] = getPointsFromVertex(index,shape_vertices,G,orthogonal_unit_hyperplane_vector,value_of_equation,[],[],[],0);
