function [sym_derivative] = calcDerivative(sym_function)
%returns in symbolic format the derivative of the smybolic format sym_function 
sym_derivative = diff(sym_function);
end


