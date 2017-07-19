%makes new partitions to form regions accorgding to new combination of
%hyperplanes
function [regions,region_counter] = createRegionsFromAValidComb(regions,region_counter,comb,i)
    
	b = createBinaryCounterMatrix(i);
    r = region_counter;
    h = size(regions{1,2},1);
    
    for i = 1:r-1       
       [bool,index] =  findIfRegionMustBePartitioned(regions{i,2},comb,b);
       if(bool)          
          regions{i,2}(comb(:,end),1) = 1;
          regions{i,2}(comb(:,end),2) = b(index,end);
          %regions{region_counter,2} = regions{i,2};
          %regions{region_counter,2}(comb(:,end),2) = b(index,end);
          b(index,:) = []; 
       end
       
    end
    
    
    for i = 1:size(b,1)      
       regions{region_counter,2}(comb,1) = 1;       
       regions{region_counter,2}(comb,2) = b(i,:)';
       region_counter = region_counter+1;
    end
    y = region_counter

        