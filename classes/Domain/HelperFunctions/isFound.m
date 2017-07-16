%returns true if all elements in vector 1 are in vector 2
function bool = isFound(vector1,vector2)
bool = 1;
k = zeros(size(vector1));
for i = 1:size(vector1,1)
   for j = 1:size(vector2,1)
       if (vector1(i,:) == vector2(j,:)) 
           k(i,:) = 1;
           break
       end
   end
end

bool = prod(k);