function [xk,iteration,A,B]= optimiseSubgradientDescentMethod(set_of_regions_functions,info_on_regions,hyperplanes,variables,x0,learning_rate,stopping_criterion)
 %fileID = fopen('MyTabl.txt','w');
A = zeros(100,6);
B = zeros(100,2);
%// Select format for text and numbers
%fprintf(fileID,'%8s %8s %8s %8s %8s %6s %6s\n','iteration','x_1', 'x_2','grad-norm','alpha','region','cputime');
  t = cputime;
  xk = x0;
  iteration = 0;
  while (1)    
      ko = cputime-t;
      logical_column_of_active_regions = calculateActiveRegions(info_on_regions,hyperplanes,variables,xk);
      [~,~,array] = calculateSubdifferential(logical_column_of_active_regions,set_of_regions_functions, xk,variables);             
      
      subgradient_step = calculateSubgradientStep(array);
      A1 = iteration;
      A2 = norm((xk-[2;3]))';
      A3 = [norm(subgradient_step),learning_rate,find(logical_column_of_active_regions==1,1), ko];
      A(iteration+1,:) = [A1 A2 A3];
      B(iteration+1,:) = [xk(1,:),xk(2,:)];
      %fprintf(fileID,'%9d \t %.2f \t %.2f \t %7.4f \t %2.2f \t %.0f \t %.2f\n',A)
      if (norm(subgradient_step)<stopping_criterion)
          break 
      end           
      
      [xk,learning_rate] = updateX(xk, set_of_regions_functions{1,find(logical_column_of_active_regions==1,1)},subgradient_step,learning_rate,createSymbolicVariables(variables),0)
      iteration = iteration + 1;
      

  end
  A(iteration+2:end,:) = [];
  B(iteration+2:end,:) = [];
  %fclose(fileID);