function output = getMoreRowVectorsByPeturbation(j_array,no_of_vectors_needed,max_peturb)
i = 1;
j = 1;
if (size(j_array,1) >= no_of_vectors_needed)
    return
end
output = zeros(no_of_vectors_needed,size(j_array,2));
for k=1:size(j_array,1)
    output(k,:) = j_array(k,:);
    j = j+1;
end
while (j < no_of_vectors_needed+1)
    output(j,:) = peturbArray(j_array(i,:),max_peturb);   
    i = i+1;
    j = j+1;
    if (i == size(j_array,1))
        i = 1;
    end
end
