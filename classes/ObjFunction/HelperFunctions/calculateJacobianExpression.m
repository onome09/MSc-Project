function [jacobianExpression] = calculateJacobianExpression(aRegion)
    jacobianExpression = jacobian(aRegion.functions,sym(aRegion.symbolic_variables));