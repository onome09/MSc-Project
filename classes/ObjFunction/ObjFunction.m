classdef ObjFunction
   properties
      regions
      jacobian_matrices
   end
   methods
      function obj = ObjFunction(aFullRegionorDefinedRegion)
         obj.regions = aFullRegionorDefinedRegion.regions;
         obj.jacobian_matrices = cell(0);
      end 
    function [xk,iteration]= optimiseNewtonMethod(obj,x0,learning_rate,stopping_criterion)
          aRegion = obj.regions{1,1};
          xk = x0;
          iteration = 0;
          jacobian = calculateJacobianExpression(aRegion);
          hessian = calculateHessianExpression(aRegion);
          var = aRegion.symbolic_variables;
          subbed_jacobian = 1000;
          while (norm(subbed_jacobian)>stopping_criterion)
            subbed_jacobian = subXIntoJacobian(jacobian,var,xk);
            subbed_hessian = subXIntoHessian(hessian,var,xk);
            newton_step = calculateNewtonStep(subbed_jacobian,subbed_hessian);
            xk = updateX(xk, newton_step,learning_rate);
            iteration = iteration + 1;
            %disp(subbed_jacobian)
          end
      end
   end
end