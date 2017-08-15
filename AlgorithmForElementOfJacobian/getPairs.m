function pairs = getPairs(convex_hull)
    m = size(convex_hull,1);
    n = size(convex_hull,2);
    pairs = zeros(m*(n-1),2);
    count = 1;
    for i = 1:m
        for j = 1:n-1
            pairs(count,1:2) = convex_hull(i,j:j+1);
            count = count + 1;
        end
    end