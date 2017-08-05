function [xk,iteration]= optimiseVectorSubgradientDescentMethod(set_of_regions_functions,info_on_regions,hyperplanes,variables,x0,learning_rate,stopping_criterion)
  xk = x0;
  iteration = 0;
  while (1)              
      logical_column_of_active_regions = calculateActiveRegions(info_on_regions,hyperplanes,variables,xk);
      [~,~,arrayofvectorisedJacobians] = calculateGeneralisedJacobian(logical_column_of_active_regions,set_of_regions_functions, xk,variables);             
      
      
      [jacobian_step,criterion] = calculateJacobianStep(arrayofvectorisedJacobians,size(xk,1))
      %[jacobian_step,criterion] = calculateJacobianStep2(xk,arrayofvectorisedJacobians,set_of_regions_functions{1,find(logical_column_of_active_regions==1,1)},createSymbolicVariables(variables));

      if (criterion<stopping_criterion)
          break 
      end
      [xk,learning_rate] = updateX(xk,set_of_regions_functions{1,find(logical_column_of_active_regions==1,1)} , jacobian_step,learning_rate,createSymbolicVariables(variables))
      iteration = iteration + 1; 
      learning_rate = 10000000;
  end