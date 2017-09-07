%finds the the value of the support function for a unit vector
function [v] = getSupportFunctionValueMaximumForUnitVector(unit_vector_orthogonal_to_hyper_plane)
%    u = unit_vector_orthogonal_to_hyper_plane;
%    norm(u)
%    t = atan(u(1,1)/u(2,1));
%    r = 2;
%    vectors = [0 r;r 0;0 -r;-r 0];
%    if (u(2,1)>0)
%        if (t>-pi/4 && t<=pi/4)
%            a = vectors(1,:);
%        else
%            if (t>pi/4)
%                a = vectors(2,:);
%            else
%                a = vectors(4,:);
%            end
%        end
%    else
%        if (t>-pi/4 && t<=pi/4)
%            a = vectors(3,:);
%        else
%            if (t>pi/4)
%                a = vectors(4,:);
%            else
%                a = vectors(2,:);
%            end
%        end
%    end
%     v =  (a*u) ;
    f = 1;
    a = f * unit_vector_orthogonal_to_hyper_plane;    
    v = (a'*a)

    