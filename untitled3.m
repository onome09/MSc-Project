[X,Y] = meshgrid(-2:0.1:2,-2:0.1:2);
Z = zeros(size(Y,2),size(Y,2));
for i = 1:size(X,2)
    for j = 1:size(Y,2)
        Z(i,j) = ((1 - X(i,j))^2 + 2*(Y(i,j)  - X(i,j)^2)^2);
    end
end
contourf(X,Y,Z,100)