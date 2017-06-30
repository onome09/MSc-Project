function output = peturbArray(array,max_pet)
output = array;
for i = 1:size(array,1)
    for j = 1:size(array,2)
       output(i,j) = array(i,j) + max_pet*(rand*2-1); 
    end 
end