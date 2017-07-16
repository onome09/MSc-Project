function bool = check(comb,active_region_matrix)
bool = 0;

if (size(comb,1)==0)
    bool = 1;

    return
end


if (isFound(comb(:,1:end-1)',find(active_region_matrix==1)))
    bool = 1;

end