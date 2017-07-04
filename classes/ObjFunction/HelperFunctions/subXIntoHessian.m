function r = subXIntoHessian(hessian,var,xk)
    r = hessian;
    for i = 1:size(var,2)
        r = subs(r,var(1,i),xk(i,1));    
    end