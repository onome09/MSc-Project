function b = createBinaryCounterMatrix(n)

    b = zeros(2^n,n);
    p = n;
    for k = 2:2^n
        b(k,1:p) = [b(k-1,1:(p-1)),1];
        p = find(b(k,:)==0,1,'last');
    end