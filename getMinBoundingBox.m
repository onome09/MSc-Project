%gets the minimum bounding box for a convex set in R^n 
function box = getMinBoundingBox(points)

no_of_points = size(points,1);
dimension = size(points,2);
A = zeros(2*no_of_points*dimension,2*dimension);
b= zeros(2*no_of_points*dimension,1);

f = ones(1,2*dimension);
for k = 1:dimension
       f(1,2*k-1)= -1;
end
for i = 1:no_of_points
    for j = 1:dimension
        
        A(dimension*2*(i-1)+2*j,2*j) = -1;
        b(dimension*2*(i-1)+2*j,1) = points(i,j);
        A(dimension*2*(i-1)+2*j-1,2*j-1) = 1;
        b(dimension*2*(i-1)+2*j-1,1) = -1*points(i,j);
    end
end

box = linprog(f,A,b);
box = -box;
