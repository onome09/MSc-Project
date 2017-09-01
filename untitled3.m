x = linspace(-6,2);
y = zeros(size(x));
for i = 1:size(x,2)
    if x(1,i) >-1
        y(1,i) = 0.25*(x(1,i)+2)^2+3.75;
    else
        if x(1,i) > -4
            y(1,i) = (x(1,i)+3)^2;
        else 
            y(1,i) = (-x(1,i))^0.5 -1;
        end
    end  
end