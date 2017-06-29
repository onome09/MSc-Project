function [output] = checkNoExtraVariables(symbolic_variables, symbolic_function)
%returns false if any variables in symbolic function are not found in
%symbolic variables
symbolic_variables_in_function = symvar(symbolic_function);
output = true;
for i = 1:size(symbolic_variables_in_function,2)
   if (~checkIfVariablePresentInArray(symbolic_variables_in_function(1,i), symbolic_variables, 2))
        output = false;
        break
   end    
end



