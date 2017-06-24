function output = addToCellRow(input, object)

output = addMoreCellsToRowOrColumnArray(input, 1, 2);
output{1, size(output,2)} = object;