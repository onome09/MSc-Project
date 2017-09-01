function J = getJacobianOfFlattenedFunction(symbolic_flattenened_function,no_of_functions)
    a = symbolic_flattenened_function;
    J = reshape(jacobian(a, symvar(a)),[no_of_functions,size(symvar(a),2)/no_of_functions]);
end