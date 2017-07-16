function [bool,index] =  findIfRegionMustBePartitioned(region_info,comb,b)
    
    bool = 0;
    h = size(region_info,1);
    mask2 = zeros(h,1);    
    
    mask2(comb,:) = region_info(comb,2);    
    mask2(comb(:,end),:) = 1;
index = 0;
    for i = 1:size(b,1)
        mask = zeros(h,1);
        
        mask(comb,:) = b(i,:)';
        mask(comb(:,end),:) = 1;

        if (prod(mask == mask2) && check(comb,region_info(:,1)))
           bool = 1;
           index = i;
           break 
        end
    end
    