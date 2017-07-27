function [xk,iteration]= optimiseSubgradientDescentMethod(set_of_regions_functions,info_on_regions,hyperplanes,variables,x0,learning_rate,stopping_criterion)
  xk = x0;
  iteration = 0;
  while (1)              
      logical_column_of_active_regions = calculateActiveRegions(info_on_regions,hyperplanes,variables,xk);
      [~,~,array] = calculateSubdifferential(logical_column_of_active_regions,set_of_regions_functions, xk,variables);             
      subgradient_step = calculateSubgradientStep(array);
      if (norm(subgradient_step)<stopping_criterion)
          break 
      end              
      xk = updateX(xk, subgradient_step,learning_rate)
      iteration = iteration + 1;              
  end