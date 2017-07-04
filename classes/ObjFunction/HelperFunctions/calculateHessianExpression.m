function [HessianExpression] = calculateHessianExpression(aRegion)
    HessianExpression = hessian(aRegion.functions{1,1},sym(aRegion.symbolic_variables));