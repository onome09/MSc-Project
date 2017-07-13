function bool = compareAllButLast(input, choices, inequalities)
bool = 1;
for i=1:size(choices,2)-1
    
   if (input(choices(1,i),1)==1)  
       if (input(choices(1,i),2)==inequalities(1,i))
           
       else
           
            bool = 0;
            break
       end
   else
       
   end
   
end
