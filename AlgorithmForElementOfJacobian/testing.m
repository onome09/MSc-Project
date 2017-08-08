s = randi([-5 5],6,3);

con = convhulln(s);
new_points = getUniquePoints(con, s);

scatter3(s(:,1),s(:,2),s(:,3))

trisurf(con,s(:,1), s(:,2),s(:,3))
rotate3d on

[hyper_rectangle_vertices,G] = convertBoxBoundsToRectangles(new_points);


