%checks if row of numbers have n values the same

function bool = checkHasNTheSame(row1,row2,n)
dim = size(row1,2);
bool = 1;
count = 0;
for i = 1:dim
    if(row1(:,i) == row2(:,i))
        count = count+1;
    end
end
if (count < n)
    bool = 0;
end