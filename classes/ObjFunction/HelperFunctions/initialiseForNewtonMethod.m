function [xk,symbolic_variables,iteration,jacobian,hessian,subbed_jacobian,symbolic_objFunction] = initialiseForNewtonMethod(x0,objFunction,variables)

          xk = x0;
          iteration = 0;
          symbolic_variables = createSymbolicVariables(variables);
          symbolic_objFunction = createSymbolicFunction(variables,objFunction);
          jacobian = calculateJacobianExpression(symbolic_objFunction,symbolic_variables);
          hessian = calculateHessianExpression(symbolic_objFunction,symbolic_variables);
          subbed_jacobian = 1000;