function output = copyIndexedToCell(input, indices)
    output = cell(1,size(indices,2));
    for i = 1:size(indices,2)
        output{1,i} = input{1,indices(1,i)};
    end