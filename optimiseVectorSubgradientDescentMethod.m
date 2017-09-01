function [xk,iteration,A,B]= optimiseVectorSubgradientDescentMethod(set_of_regions_functions,info_on_regions,hyperplanes,variables,x0,learning_rate,stopping_criterion,newton)
  xk = x0;
  iteration = 0;
  A = zeros(100,6);
  B = zeros(100,2);
  criterion1 = 1000;
  t = cputime;
  while (1)
      ko = cputime-t;
      logical_column_of_active_regions = calculateActiveRegions(info_on_regions,hyperplanes,variables,xk);
      [~,~,arrayofvectorisedJacobians] = calculateGeneralisedJacobian(logical_column_of_active_regions,set_of_regions_functions, xk,variables);                   
      if (~newton)
      [jacobian_step,criterion] = calculateJacobianStep(arrayofvectorisedJacobians,size(xk,1));
      else
      [jacobian_step,criterion] = calculateJacobianStep2(xk,arrayofvectorisedJacobians,set_of_regions_functions{1,find(logical_column_of_active_regions==1,1)},createSymbolicVariables(variables));
      end
      
      if (abs(criterion-criterion1) < stopping_criterion)
          break 
      end
      criterion1 = criterion;
      [xk,~] = updateX(xk,set_of_regions_functions{1,find(logical_column_of_active_regions==1,1)} , jacobian_step,learning_rate,createSymbolicVariables(variables),newton);
      iteration = iteration + 1; 
      learning_rate = 0.1;
      A1 = iteration;
      A2 = norm((xk-[3;2.5]))';
      A3 = [criterion,learning_rate,find(logical_column_of_active_regions==1,1), ko];
      A(iteration,:) = [A1 A2 A3];
      B(iteration,:) = [xk(1,:),xk(2,:)];
  end
  A(iteration+1:end,:) = [];
  B(iteration+1:end,:) = [];