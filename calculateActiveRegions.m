function indices_of_active_regions = calculateActiveRegions(info_on_regions,cell_of_hyperplanes,variables_string,point)
    s = size(info_on_regions,2);
    t = size(cell_of_hyperplanes,2);
    indices_of_active_regions = zeros(s,1);
    hyperplane_info = cell2mat(vertcat(info_on_regions'));
    for i = 1:s
        valid = 1;
        for j = 1:t
            k = (i-1)*t + j;
            
            if (hyperplane_info(k,1)>0)
                if(~testPointInHyperPlane(cell_of_hyperplanes{1,j},variables_string, hyperplane_info(k,2),point))
                    valid = 0;
                    break; 
                end
            end
        end
        if (valid)
            indices_of_active_regions(i,1) = 1;
        end
    end
end