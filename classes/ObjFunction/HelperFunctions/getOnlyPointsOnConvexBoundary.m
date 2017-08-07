function new_points = getOnlyPointsOnConvexBoundary(convex_hull_indices,points)
    m = size(convex_hull_indices,1);
    n = size(convex_hull_indices,2);

    a = reshape(convex_hull_indices,[m*n,1]);
    b = unique(a,'first');
    new_points = points(b,:);
    
