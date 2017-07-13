function output = copyIndexedToCell(input, indices,objects)
    output = cell(1,size(indices,2));
    for i = 1:size(indices,2)
        
        input{1,i} = objects{1,indices(:,i)}.symbolic_hyperplane_function;
    end
    output = input;