
%new_points = [-1 -1 -1; -1 -1 1; -1 1 -1; -1 1 1; 1 -1 -1; 1 -1 1; 1 1 -1; 1 1 1];

new_points = 0.5*[-1 -1; -1 1; 1 -1; 1 1];
%con = convhulln(s);


[box_bounds] = getMinBoundingBox(new_points);

[hyper_rectangle_vertices,G,edge_matrix] = convertBoxBoundsToRectangles(box_bounds);
shape_vertices = hyper_rectangle_vertices;

index = 1;
for i = 1:19
    

[orthogonal_unit_hyperplane_vector,neighbouring_vertices,neighbouring_vertices_indices,vertex] = getUnitVectorHyperPlaneOfNeighbours(index, shape_vertices,G);
    
    
    [value_of_equation] = getSupportFunctionValueMaximumForUnitVector(orthogonal_unit_hyperplane_vector);
  shape_vertices(index,:)
       shape_vertices(index,:)
       
       
    %[new_points_connected] = findNewPointsToConnectForNeighbouringVertices(orthogonal_unit_hyperplane_vector,value_of_equation,shape_vertices(index,:),neighbouring_vertices)
    [new_points_connected,index_of_connecting_points,indices_of_vertices_to_delete] = findNewPointsToConnectForNeighbouringVertices2(orthogonal_unit_hyperplane_vector,value_of_equation,index,shape_vertices,G);

    edge_matrix_for_new_points = workOutConvexConnections(shape_vertices(index_of_connecting_points,:));
 
        
    [shape_vertices,G] = modifyPolytope(shape_vertices,G,index_of_connecting_points,new_points_connected,edge_matrix_for_new_points,indices_of_vertices_to_delete);    
end

s = shape_vertices;
if size(new_points,2) < 3
    
    k = convhulln(s);
    x = s(:,1);
    y = s(:,2);
    scatter(s(:,1),s(:,2));
plot(x(k),y(k),'r-',x,y,'b*')
else
    h =new_points_connected;
    scatter3(h(:,1),h(:,2),h(:,3),30);
    hold on

    trisurf(convhulln(s),s(:,1), s(:,2),s(:,3));
end
rotate3d on