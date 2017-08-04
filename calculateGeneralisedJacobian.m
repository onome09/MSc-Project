function [subdifferential,area,array_of_vectorised_jacobians] = calculateGeneralisedJacobian(logical_column_of_active_regions,set_of_regions_functions, point_array,variables_string)
    s = sum(logical_column_of_active_regions,1);
    b = size(varString2Array(variables_string),2);
    c = size(set_of_regions_functions{1,1},2);
    array_of_vectorised_jacobians = zeros(s,b*c);
    count = 1;
    for i = 1:(size(logical_column_of_active_regions,1))   
        if (logical_column_of_active_regions(i,1) >0)
            aPoint = Point(b);
            aPoint = aPoint.setPoint(point_array);
            a = calculateLimitOfJacobian(set_of_regions_functions{1,i}, variables_string,aPoint);
            a = reshape(a,[1,c*b]);
            array_of_vectorised_jacobians(count,:) = a;
            count = count + 1;
        else

        end
    end 
    if (s < 2 ||b < 2)
        subdifferential = 0;
        area = 0;
        return
    end

    new_array2 = getMoreRowVectorsByPeturbation(array_of_vectorised_jacobians,s*b+1,0.0001);
    
    [subdifferential,area] = convhulln(new_array2);