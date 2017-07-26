function [xk,iteration,jacobian,hessian,subbed_jacobian] = initialiseForNewtonMethod(x0,aRegion)

          xk = x0;
          iteration = 0;
          jacobian = calculateJacobianExpression(aRegion);
          hessian = calculateHessianExpression(aRegion);
          subbed_jacobian = 1000;