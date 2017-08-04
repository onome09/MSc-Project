classdef Point
  properties
    variables
  end
  methods      
      function obj = Point(n)
          
          obj.variables = zeros(n,1);
          obj.variables(1:n,1) = zeros(n,1);
      end
      function obj = setPoint(obj,point_array)
          obj.variables(1:size(point_array,1),1) = point_array;
      end
      
      function a = equals(obj,aPoint)         
          a = 0;
          if (size(obj.variables,1) ~= size(aPoint.variables,1))
             return;
          end
          for i=1:size(obj.variables,1)
             if (aPoint.variables(i,:) ~= obj.variables(i,:))
                 return;
             end
          end
          a = 1;
      end
      
  end
end