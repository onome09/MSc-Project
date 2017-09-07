function [scalar] = supportFunctionToEdit(unit_vector)
%     a = 3;
%     b = 2;
%     d = 2;
%     
%     [x,scalar] = fmincon(@fun,[0,0,0],[],[],[],[],[],[],@noncon);
%     
%     function f = fun(x) 
%         f = x(1)*unit_vector(1,1)+x(2)*unit_vector(2,1)+x(3)*unit_vector(3,1);
%     end
% 
%     function [c,ceq] = noncon(x)
%         c = - 1;
%         ceq = x(1)^2/a^2+x(2)^2/b^2+x(3)^2/d^2-1;
%     end
% end
% 
   t = atan(unit_vector(1,1)/unit_vector(2,1));
   r = 2;
   vectors = [0 r;r 0;0 -r;-r 0];
   if (unit_vector(2,1)>0)
       if (t>-pi/4 && t<=pi/4)
           a = vectors(1,:);
       else
           if (t>pi/4)
               a = vectors(2,:);
           else
               a = vectors(4,:);
           end
       end
   else
       if (t>-pi/4 && t<=pi/4)
           a = vectors(3,:);
       else
           if (t>pi/4)
               a = vectors(4,:);
           else
               a = vectors(2,:);
           end
       end
   end
   scalar =  (a*unit_vector) ;