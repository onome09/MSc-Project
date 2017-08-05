function [jacobian_step,criterion] = calculateJacobianStep(array_of_vectorised_jacobians,no_of_variables)
    s = size(array_of_vectorised_jacobians,2)/no_of_variables;
    %coeffs = randomarray(size(array_of_gradients,1), 1);
    coeffs = (1/size(array_of_vectorised_jacobians,1)*ones(size(array_of_vectorised_jacobians,1), 1));   
    jacobian_step = repmat(coeffs,1,size(array_of_vectorised_jacobians,2));
    jacobian = sum(jacobian_step.*array_of_vectorised_jacobians,1);
    jacobian = reshape(jacobian,[s,no_of_variables]);
    
    criterion = norm(jacobian,Inf)
    jacobian
    %x0 = ones(no_of_variables,1);
    x0 = [0.2;0.8];
    
    jacobian_step = fminimax(@fun,x0,[],[],[],[],[],[],[]);
    function f = fun(x)
        f = zeros(1,s);
        for i = 1:s
            f(1,i) = jacobian(i,:)*x +0.5 * norm(x)^2;
        end
    end 
    function [c,ceq] = mycon(x)
        h1 = size(x,1);
        h2 = 1/h1;
        a = [1:h1]';
        %sum(abs(a.*x - a.*((h2*ones(h1,1)).^h2))) - 0.01;
        c = - 1;
        ceq = max(x) - 1; 
    end

end
      
