%creates a list of the verteces of the hyperrectangle from the list of
%box bounds and also returns an associated edge list for the hyperrectangle
%to see which rectangle is connected to what.
function [vertexes_of_hyperectangle,G,A] = convertBoxBoundsToRectangles(box_bounds)
    dim = size(box_bounds,1)/2;
    t = createBinaryCounterMatrix(dim);
    r = zeros(2^dim,dim);
    A = zeros(2^dim,2^dim);
    for i = 1:2^dim
       for j = 1:dim
          if (t(i,j) > 0)
              r(i,j) = box_bounds(2*j-1,1);
          else
              r(i,j) = box_bounds(2*j,1);
          end           
       end
       for k = 1:i-1
           for j = 1:dim
                if (checkHasNTheSame(r(k,:),r(i,:),dim-1))
                    A(k,i) = 1;
                    A(i,k) = 1;
                end           
            end
       end 
    end
    
    vertexes_of_hyperectangle = r;
    
    G = graph(A);
    