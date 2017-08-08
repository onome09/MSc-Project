function [orthogonal_unit_hyperplane_vector] = getUnitVectorHyperPlaneOfNeighbours(index, hyperplane_vertices, graph)

    points_of_hyperplane = hyperplane_vertices(findIndicesOfNeighbouringVertices(index,graph),:);
    hyperplane_parameters = getHyperPlaneThroughPoints(points_of_hyperplane);
    orthogonal_unit_hyperplane_vector = hyperplane_parameters/norm(hyperplane_parameters);