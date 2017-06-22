function [output] = addMoreCellsToRowOrColumnArray(input_cell_array, n, dim)
    
    if (size(input_cell_array,dim) ==0)
        output = cell(1);
        return
    end
    if (dim > 1)
       
        output = cell(1, size(input_cell_array,2)+n);
        for i = 1:size(input_cell_array,2)
            output{1,i} = input_cell_array{1,i};
        end
    else
        output = cell(size(input_cell_array,2)+n, 1);
        for i = 1:size(input_cell_array,1)
            output{i,1} = input_cell_array{i,1};
        end
    end
    