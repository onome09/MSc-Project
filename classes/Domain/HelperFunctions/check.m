function bool = check(comb,active_region_matrix)
bool = 0;

if (size(comb,1)==0)
    bool = 1;

    return
end
if (size(comb,2)==1 && ~size(setdiff(comb,find(active_region_matrix==1)),2) < 1)
    bool = 0;
    disp(find(active_region_matrix==1))
    return
end
disp(comb)
disp(find(active_region_matrix==1))
if (size(setdiff(comb,find(active_region_matrix==1)),2) < 2)
    bool = 1;
    disp('yes')
end