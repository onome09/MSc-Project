%s = randi([-5 5],20,3);
new_points = [-1 -1 -1; -1 -1 1; -1 1 -1; -1 1 1; 1 -1 -1; 1 -1 1; 1 1 -1; 1 1 1];

%new_points = [-1 -1; -1 1; 1 -1; 1 1];
%con = convhulln(s);
%new_points = getUniquePoints(con, s);

%scatter3(s(:,1),s(:,2),s(:,3));

%trisurf(con,s(:,1), s(:,2),s(:,3));
%rotate3d on

[box_bounds] = getMinBoundingBox(new_points);

[hyper_rectangle_vertices,G,edge_matrix] = convertBoxBoundsToRectangles(box_bounds);
shape_vertices = hyper_rectangle_vertices;

index = 1;
for i = 1:4
    [orthogonal_unit_hyperplane_vector,neighbouring_vertices,neighbouring_vertices_indices,vertex] = getUnitVectorHyperPlaneOfNeighbours(index, shape_vertices,G);
    
    
    [value_of_equation] = getSupportFunctionValueMaximumForUnitVector(orthogonal_unit_hyperplane_vector);
    orthogonal_unit_hyperplane_vector
    value_of_equation
    [new_points_connected] = findNewPointsToConnectForNeighbouringVertices(orthogonal_unit_hyperplane_vector,value_of_equation,shape_vertices(index,:),neighbouring_vertices)
    edge_matrix_for_new_points = workOutConvexConnections(new_points_connected);
    [shape_vertices,G] = modifyPolytope(shape_vertices,G,neighbouring_vertices_indices,new_points_connected,edge_matrix_for_new_points,index);
    
end
%figure()
s = shape_vertices;
k = convhulln(s);
x = s(:,1);
y = s(:,2);
%scatter(s(:,1),s(:,2));
%plot(x(k),y(k),'r-',x,y,'b*')
scatter3(s(:,1),s(:,2),s(:,3));

trisurf(convhulln(s),s(:,1), s(:,2),s(:,3));
rotate3d on