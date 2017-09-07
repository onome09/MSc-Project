function [vertices] = approximateConvexSetWithSupportFunction(hypercube_vertices,iter)
%hypercube_vertices = [-1 -1 -1 -1; -1 -1 -1 1; -1 -1 1 -1; -1 -1 1 1; -1 1 -1 -1; -1 1 -1 1; -1 1 1 -1; -1 1 1 1; 1 -1 -1 -1; 1 -1 -1 1; 1 -1 1 -1; 1 -1 1 1; 1 1 -1 -1; 1 1 -1 1; 1 1 1 -1; 1 1 1 1];

[box_bounds] = getMinBoundingBox(hypercube_vertices);

[hyper_rectangle_vertices,G,edge_matrix] = convertBoxBoundsToRectangles(box_bounds);
shape_vertices = hyper_rectangle_vertices;

index = 1;
h = waitbar(0,'Please wait...');
i = 1;
while i <iter && index<=size(shape_vertices,1)
    [orthogonal_unit_hyperplane_vector,neighbouring_vertices,neighbouring_vertices_indices,vertex] = getUnitVectorHyperPlaneOfNeighbours(index, shape_vertices,G);
    if (checkIfHyperRectangleSurface(orthogonal_unit_hyperplane_vector)||~notTheSame(shape_vertices(index,:), shape_vertices(neighbouring_vertices_indices,:)))
        error = 1;
    else
        [value_of_equation] = supportFunctionToEdit(orthogonal_unit_hyperplane_vector);
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
       
    end

    error = 0;
end
close(h)
s = shape_vertices;

if size(hypercube_vertices,2) == 2
    
    k = convhulln(s);
    x = s(:,1);
    y = s(:,2);
    scatter(s(:,1),s(:,2));
plot(x(k),y(k),'r-',x,y,'b*')
else
    if size(hypercube_vertices,2) == 3
        hold off

        trisurf(convhulln(s),s(:,1), s(:,2),s(:,3));
        hold on
        rotate3d on
    end
end
vertices = s;
