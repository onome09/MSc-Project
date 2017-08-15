s = randi([-5 5],20,3);

con = convhulln(s);
new_points = getUniquePoints(con, s);

scatter3(s(:,1),s(:,2),s(:,3));

trisurf(con,s(:,1), s(:,2),s(:,3));
rotate3d on
[box_bounds] = getMinBoundingBox(new_points);

[hyper_rectangle_vertices,G,edge_matrix] = convertBoxBoundsToRectangles(box_bounds);
shape_vertices = hyper_rectangle_vertices;

index = 1;
for i = 1:10
    [orthogonal_unit_hyperplane_vector,neighbouring_vertices,neighbouring_vertices_indices,vertex] = getUnitVectorHyperPlaneOfNeighbours(index, shape_vertices,G);


    [hyperplane_parameters,value_of_equation] = getSupportFunctionValueMaximumForUnitVector(orthogonal_unit_hyperplane_vector,new_points);
    [new_points_connected] = findNewPointsToConnectForNeighbouringVertices(orthogonal_unit_hyperplane_vector,value_of_equation,shape_vertices(index,:),neighbouring_vertices);
    edge_matrix_for_new_points = workOutConvexConnections(new_points_connected);
    [shape_vertices,G] = modifyPolytope(shape_vertices,G,neighbouring_vertices_indices,new_points_connected,edge_matrix_for_new_points);
    index = index+1;
end
figure()
s = shape_vertices;
scatter3(s(:,1),s(:,2),s(:,3));

trisurf(con,s(:,1), s(:,2),s(:,3));
rotate3d on