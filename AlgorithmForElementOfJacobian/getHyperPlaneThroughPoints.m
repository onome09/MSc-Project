function [hyperplane_parameters] = getHyperPlaneThroughPoints(points_of_hyperplane)
    m = size(points_of_hyperplane,1);
    
    A = points_of_hyperplane;
    b = ones(m,1);
    hyperplane_parameters = linsolve(A,b);
