function displayCellArray(array)

for i = 1:size(array,1)
    string = '';
   for j = 1:size(array,2)
       if (j > 1)
           string = strcat(string, '|');
       end
           string = strcat(string, array{i,j});
   end   
   disp(string)   
end