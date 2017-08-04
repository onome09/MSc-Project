function [subdifferential,area,new_array] = calculateSubdifferential(logical_column_of_active_regions,set_of_regions_functions, point_array,variables_string)
    s = sum(logical_column_of_active_regions,1);
    b = size(varString2Array(variables_string),2);   
    new_array = zeros(s,b);
    count = 1;

    for i = 1:(size(logical_column_of_active_regions,1))   
        if (logical_column_of_active_regions(i,1) >0)
            
            aPoint = Point(b);
            aPoint = aPoint.setPoint(point_array);
            aPoint.variables;
            a = calculateLimitOfDerivative(set_of_regions_functions{1,i}, variables_string,aPoint);
            new_array(count,:) = a;
            count = count + 1;
        else

        end
    end 
    if (s < 2 ||b < 2)
        subdifferential = 0;
        area = 0;
        return
    end

    new_array = getMoreRowVectorsByPeturbation(new_array,b+1,0.0001);
    
    [subdifferential,area] = convhulln(new_array);
      