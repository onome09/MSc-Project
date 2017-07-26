function [newton_step] = calculateNewtonStep(aRegion)

    newton_step =  double(subbed_hessian)'\(0 - double(subbed_jacobian)');