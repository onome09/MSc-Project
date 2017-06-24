function string_array = convertSymbolicArrayToStringArray(symbolic_array)
string_array = '';
for i = 1:size(symbolic_array,2)
    if (i>1)
        string_array =strcat( string_array, ',');
    end
    string_array = strcat( string_array, char(symbolic_array(1,i)));
end;