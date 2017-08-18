%works out how new vwrticaes would be connected is a convex hull was drawn
%around them
function [edge_matrix] = workOutConvexConnections(vertices)
    n = size(vertices,1);
    if (n > size(vertices,2))
        convex_hull = convhulln(dimred(vertices));
        edge_matrix = populateEdgeMatrix(convex_hull,n);
    else
        edge_matrix = 1 - eye(n);
    end
    
