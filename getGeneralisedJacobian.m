function GeneralisedJacobianVertices = getGeneralisedJacobian(point,variables_string,varargin)
    h = size(varargin,2);
    GeneralisedJacobianVertices = cell(1,h);
    m = size(varargin{1,1},2);
    functions = cell(1,2);
    big_point = repelem(point,m);
    for i = 1:h
        for j = 1:m
            functions{1,j} = varargin{1,i}{1,j};
        end
        [flattened_function] = flattenregion(functions,variables_string);
        J = getJacobianOfFlattenedFunction(flattened_function,m);
        var = symvar(J);
      
        GeneralisedJacobianVertices{1,i}=double(subXIntoJacobian(J,var,big_point));
    end
end