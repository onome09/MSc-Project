function [jacobianExpression] = calculateJacobianExpression(objFunction,symbolic_variables)
    jacobianExpression = jacobian(objFunction,symbolic_variables);