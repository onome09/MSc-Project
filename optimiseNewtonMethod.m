function [xk,iteration,f]= optimiseNewtonMethod(objFunction,learning_rate,variables,x0,stopping_criterion)
  h = 0;
  [xk,symbolic_variables,iteration,jacobian,hessian,subbed_jacobian,sym_objFunction] = initialiseForNewtonMethod(x0,objFunction,variables);
  f = [x0(1,1),x0(2,1)];
  while (norm(subbed_jacobian)>stopping_criterion)
    subbed_jacobian = subXIntoJacobian(jacobian,symbolic_variables,xk);
    subbed_hessian = subXIntoHessian(hessian,symbolic_variables,xk);
    newton_step = calculateNewtonStep(subbed_jacobian,subbed_hessian);
    xk = updateX(xk,sym_objFunction ,newton_step,learning_rate,symbolic_variables)
    if h == 0
        f = [f;[xk(1,1),xk(2,1)]];
    end
    
    iteration = iteration + 1;
    h = h+1;
    if (h >5)
        h = 0;
    end
        
  end
