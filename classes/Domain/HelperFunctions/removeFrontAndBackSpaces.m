function old_string = removeFrontAndBackSpaces(old_string)

while (old_string(size(old_string, 2))==' ')
   old_string(size(old_string,2)) = [];
end

while (old_string(1,1)==' ')
   old_string(:,1) = [];
end