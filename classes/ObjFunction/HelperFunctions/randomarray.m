function array = randomarray(n,total)

array = zeros(n,1);
for i = 1:n
   array(i,1) = rand; 
end




array = array * total/sum(array);    