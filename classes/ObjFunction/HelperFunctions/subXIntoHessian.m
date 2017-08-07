%substitute the value of xk into a symbolic expression for the hessian
function r = subXIntoHessian(hessian,var,x)
    r = hessian;
    for i = 1:size(var,2)
        r = subs(r,var(1,i),x(i,1));    
    end