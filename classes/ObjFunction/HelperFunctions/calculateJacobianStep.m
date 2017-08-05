function [jacobian_step,criterion] = calculateJacobianStep(array_of_vectorised_jacobians,no_of_variables)
    s = size(array_of_vectorised_jacobians,2)/no_of_variables;
    %coeffs = randomarray(size(array_of_gradients,1), 1);
    coeffs = (1/size(array_of_vectorised_jacobians,1)*ones(size(array_of_vectorised_jacobians,1), 1));   
    jacobian_step = repmat(coeffs,1,size(array_of_vectorised_jacobians,2));
    jacobian = sum(jacobian_step.*array_of_vectorised_jacobians,1);
    jacobian = reshape(jacobian,[s,no_of_variables]);   
    criterion = norm(jacobian,Inf)
    x0 = [0.5;1];
    jacobian_step = fminimax(@fun,x0,[],[],[],[],[],[],[])
    function f = fun(x)       
        for i = 1:s
            f(i) = jacobian(i,:)*x + 0.5*norm(x,2)^2;
        end
    end 
    function [c,ceq] = mycon(x)
        c = - 1;
        ceq =  0;
    end
end
      
