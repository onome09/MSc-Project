[x,y] = meshgrid(-8:0.2:8,-8:0.2:8);
z = -(x.^2 - 4*x+13+y.^2-6*y);
t =     1;
if (t>0)
    for i= 1:size(z,1)
        for j = 1:size(z,2)

            if (x(i,j)<0)
                z(i,j) = x(i,j)^2-x(i,j)+y(i,j)^2-6*y(i,j)+13;
            else
                if (x(i,j)<5)
                    z(i,j) = x(i,j)^2 - 4*x(i,j)+13+y(i,j)^2-6*y(i,j);
                else
                    z(i,j) = x(i,j)+13+y(i,j)^2-6*y(i,j);
                end            
            end                      
        end
    end
else
    for i= 1:size(z,1)
        for j = 1:size(z,2)

            if (x(i,j)<0)
                z(i,j) = x(i,j)^2-2*x(i,j)+20+y(i,j)^2-4*y(i,j);
            else
                if (x(i,j)<5)
                    z(i,j) = x(i,j)^2-8*x(i,j)+20+y(i,j)^2-4*y(i,j);
                else
                    z(i,j) = x(i,j)+y(i,j)^2-4*y(i,j)+5;
                end            
            end                      
        end
    end
end
h = contour(x,y,z,20);
rotate3d on