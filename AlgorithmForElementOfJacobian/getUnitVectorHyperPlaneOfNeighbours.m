%finds the orthogonal vector to the hyperplane that goes through the
%neighbouring points of a vertex index
function [orthogonal_unit_hyperplane_vector,points_of_hyperplane,neighbouring_vertices_indices,a] = getUnitVectorHyperPlaneOfNeighbours(index, vertices_of_convex_set, graph)
    points_of_hyperplane = vertices_of_convex_set(findIndicesOfNeighbouringVertices(index,graph),:);
    neighbouring_vertices_indices = findIndicesOfNeighbouringVertices(index,graph);
    hyperplane_parameters = getHyperPlaneThroughPoints(points_of_hyperplane);
    orthogonal_unit_hyperplane_vector = hyperplane_parameters/norm(hyperplane_parameters);
    a = vertices_of_convex_set(index,:);