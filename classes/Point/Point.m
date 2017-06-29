classdef Point
  properties
    variables
    hyperplanes_out
    regions
  end
  methods      
      function obj = Point(varargin)
          obj.variables = zeros(nargin,1);
          obj.variables(1:nargin,1) = varargin{:};
          obj.hyperplanes_out = cell(0,2);  
          obj.regions = cell(0,2);
      end
      function obj = addHyperplane(obj, aHyperPlane, left_or_right)
          obj.hyperplanes_out = addRowToColumnArray(obj.hyperplanes_out, 1);
          obj.hyperplanes_out{size(obj.hyperplanes_out,1),1} = aHyperPlane;
          obj.hyperplanes_out{size(obj.hyperplanes_out,1),2} = left_or_right;
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
      function a = isLegit(obj)
          if (size(obj.hyperplanes_out,1) > 1)
              a = 1;
          else
              a = 0;
          end
      end
  end
end