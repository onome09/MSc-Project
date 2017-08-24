
new_points = [-1 -1 -1; -1 -1 1; -1 1 -1; -1 1 1; 1 -1 -1; 1 -1 1; 1 1 -1; 1 1 1];

%new_points = [-1 -1; -1 1; 1 -1; 1 1];

[box_bounds] = getMinBoundingBox(new_points);

[hyper_rectangle_vertices,G,edge_matrix] = convertBoxBoundsToRectangles(box_bounds);
shape_vertices = hyper_rectangle_vertices;
%plot sphere
[x,y,z] = sphere;
    a = 0;
    b = 0;
    c = 0;
    r = 1.01;
index = 1;
iter = 1000;
h = waitbar(0,'Please wait...');
i = 1;
while i <iter

    [orthogonal_unit_hyperplane_vector,neighbouring_vertices,neighbouring_vertices_indices,vertex] = getUnitVectorHyperPlaneOfNeighbours(index, shape_vertices,G);
    if (checkIfHyperRectangleSurface(orthogonal_unit_hyperplane_vector))
        error = 1;
    else
        [value_of_equation] = getSupportFunctionValueMaximumForUnitVector(orthogonal_unit_hyperplane_vector);
    
        [new_points_connected,index_of_connecting_points,indices_of_vertices_to_delete,error] = findNewPointsToConnectForNeighbouringVertices2(orthogonal_unit_hyperplane_vector,value_of_equation,index,shape_vertices,G);
        if (notTheSame(shape_vertices(index,:), new_points_connected))
            edge_matrix_for_new_points = workOutConvexConnections(new_points_connected);
        else
            error = 1;
        end
    end
    if (error < 1)
        [shape_vertices,G] = modifyPolytope(shape_vertices,G,index_of_connecting_points,new_points_connected,edge_matrix_for_new_points,indices_of_vertices_to_delete);            
        index = 1;
        i = i+1;
        waitbar(i/iter,h)

    else 
       index = index+1;
       
       disp('d')
    end
    %plot sphere and stuff lol
    
    %index = randi(size(shape_vertices,1));
    i
    error = 0;
end
close(h)

s= shape_vertices;

if size(new_points,2) < 3
    
    k = convhulln(s);
    x = s(:,1);
    y = s(:,2);
    scatter(s(:,1),s(:,2));
plot(x(k),y(k),'r-',x,y,'b*')
else
hold off

    trisurf(convhulln(s),s(:,1), s(:,2),s(:,3));
    hold on
    
end
rotate3d on