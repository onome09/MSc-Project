function newStr = insertAfter(str, endStr,newText)

    k = strfind(str,endStr);
    k = k + size(endStr,2);
    newStr = str(1,1:k-1);
    newStr = strcat(newStr,newText);
    newStr = strcat(newStr,str(1,k:end));
    