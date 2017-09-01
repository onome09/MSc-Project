function [v] = ellipsoidSupportFunction(unit_vector_orthogonal_to_hyper_plane,a,b,d)

%fun = @(x)x(1)*u(1,1)+x(2)*u(2,1)+x(3)*u(3,1)
disp('hi')
[x,v] = fmincon(@fun,[0,0,0],[],[],[],[],[],[],@noncon);
function f = fun(x) 
u = unit_vector_orthogonal_to_hyper_plane;

        f = x(1)*u(1,1)+x(2)*u(2,1)+x(3)*u(3,1);
    end 
function [c,ceq] = noncon(x)
c = - 1;

ceq = x(1)^2/a^2+x(2)^2/b^2+x(3)^2/d^2-1;
end
end
