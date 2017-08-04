[x,y] = meshgrid(-3:0.1:8,-3:0.1:8);
z = -(x.^2 - 4*x+13+y.^2-6*y);


for i= 1:size(z,1)
    for j = 1:size(z,2)
        
        if (x(i,j)<0)
            z(i,j) = x(i,j)^2-x(i,j)+y(i,j)^2-6*y(i,j)+13;
        else
            if (x(i,j)<5)
                z(i,j) = x(i,j)^2-4*x(i,j)+y(i,j)^2-6*y(i,j)+13;
            else
                z(i,j) = 4*x(i,j)-2+y(i,j)^2-6*y(i,j);
            end            
        end                      
    end
end
h = surf(x,y,z)
z_1 = x_1;
for i=1:size(x_1,1)
    if (x_1(i,:)<0)
            z_1(i,:) = x_1(i,:)^2-x_1(i,:)+x_2(i,:)^2-6*x_2(i,:)+13-0.7;
    else
        if (x_1(i,:)<5)
            z_1(i,:) = x_1(i,:)^2-4*x_1(i,:)+x_2(i,:)^2-6*x_2(i,:)+13-0.7;
        else
            z_1(i,:) = 4*x_1(i,:)-2+x_2(i,:)^2-6*x_2(i,:)-0.7;
        end            
    end    
end

line(x_1,x_2,z_1,'Color','yellow','LineWidth',2);
%line(x(:,31),y(:,31),-z(:,31),'Color','red','LineWidth',2);