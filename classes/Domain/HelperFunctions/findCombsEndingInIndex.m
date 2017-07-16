function [combs_out,max_dim] = findCombsEndingInIndex(combs_in,index)
    combs_out = combs_in;
    max_dim = size(combs_out,1);
    for i = max_dim:-1:1        
        combs_out{i,1} = combs_in{i,1}(combs_in{i,1}(:,end)==index,:);
    end
    if (index < max_dim)
       max_dim = index; 
    end
      
    