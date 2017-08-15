%calculates the edge matrix by looking at the convex hull indices
function edge_matrix = populateEdgeMatrix(convex_hull,no_of_points)
    edge_matrix = zeros(no_of_points,no_of_points);
    pairs = getPairs(convex_hull);
    for i = 1:size(pairs,1)
        edge_matrix(pairs(i,1),pairs(i,2)) = 1;
        edge_matrix(pairs(i,2),pairs(i,1)) = 1;
    end
