function old_string = subSpacesForCommas(old_string)

%convert any commas to spaces
old_string(old_string==',') = ' ';