function [jacobian_step,criterion] = calculateJacobianStep2(x,array_of_vectorised_jacobians,region_functions,symbolic_variables)
    no_of_variables = size(symbolic_variables,2);
    s = size(array_of_vectorised_jacobians,2)/no_of_variables;
    %coeffs = randomarray(size(array_of_gradients,1), 1);
    coeffs = (1/size(array_of_vectorised_jacobians,1)*ones(size(array_of_vectorised_jacobians,1), 1));   
    jacobian_step = repmat(coeffs,1,size(array_of_vectorised_jacobians,2));
    jacobian = sum(jacobian_step.*array_of_vectorised_jacobians,1);
    jacobian = reshape(jacobian,[s,no_of_variables]);
    
    criterion = norm(jacobian,Inf);
    
    f = zeros(s,1);
    
    for i = 1:s
       f(i,:) = testRegionFunction(x,region_functions{1,i},symbolic_variables); 
    end
    jacobian
    f = -f;
    jacobian_step = jacobian\f;
    
end
      
