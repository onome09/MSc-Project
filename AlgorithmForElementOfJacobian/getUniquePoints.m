%gets all the points of the convex hull
function new_points = getUniquePoints(convhull_indices, points)
a = size(convhull_indices,1) *size(convhull_indices,2);

convhull = reshape(convhull_indices,[a 1]);

convhull2 = unique(convhull);


new_points = points(convhull2,:);