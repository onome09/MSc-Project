t= -8:0.01:2;
c = zeros(size(t));
for i = 1:length(t)
    if (t(i)<=-4)
        c(i)=4*(-t(i))^(1/2) -7;
    elseif (t(i)>=-4) && (t(i)<=-1)
        c(i)=(t(i)+3)^2;
    elseif (-1<=t(i)) 
        c(i)= 0.25*((t(i)+2)^2)+3.75;
    end
end