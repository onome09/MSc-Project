function [xk,iteration]= optimiseNewtonMethod(region)
  [xk,iteration,jacobian,hessian,subbed_jacobian] = initialiseForNewtonMethod(x0,aRegion);

  while (norm(subbed_jacobian)>stopping_criterion)
    subbed_jacobian = subXIntoJacobian(jacobian,aRegion.symbolic_variables,xk);
    subbed_hessian = subXIntoHessian(hessian,aRegion.symbolic_variables,xk);
    newton_step = calculateNewtonStep(subbed_jacobian,subbed_hessian);
    xk = updateX(xk, newton_step,learning_rate);
    iteration = iteration + 1;
  end
