function [HessianExpression] = calculateHessianExpression(objFunction,symbolic_variables)
    HessianExpression = hessian(objFunction,symbolic_variables);