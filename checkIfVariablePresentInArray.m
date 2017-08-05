function [output] = checkIfVariablePresentInArray(variable, array, dim)
%returns false if variable is not found in array
output = false; 
for i = 1:size(array,dim)
    if (variable == array(i))
        output = true;
        break;
    end
end
 