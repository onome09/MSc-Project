function [newton_step] = calculateNewtonStep(subbed_jacobian,subbed_hessian)

    newton_step =  double(subbed_hessian)'\(0 - double(subbed_jacobian)');