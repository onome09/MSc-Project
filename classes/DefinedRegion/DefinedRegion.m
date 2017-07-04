classdef DefinedRegion
   properties
       no_of_regions
       Points
       regions
   end
   methods
      function obj = DefinedRegion()
         obj.no_of_regions = 0;
         obj.Points = cell(0);
         obj.regions = cell(0,2);
         
      end
      function a = isFound(obj, aPoint)
          for i = 1:size(obj.Points,2)
             if (obj.Points{1,i}.equals(aPoint.variables))
                 a = i;
                return; 
             end
          end
          a = 0;    
      end      
      function obj = AddRegion(obj, aPoint, aHyperPlane, maxOrMin)
          if (isFound(obj,aPoint))
              a = isFound(obj,aPoint);
              obj.Points{1,a} = obj.Points{1,a}.addHyperPlane(aHyperPlane, maxOrMin);
              obj.no_of_regions = obj.no_of_regions + 1;
          else
              obj.Points = addToCellRow(obj.Points, aPoint);
              obj.Points{1,size(obj.Points,2)} = obj.Points{1,size(obj.Points,2)}.addHyperPlane(aHyperPlane, maxOrMin);
              obj.no_of_regions = obj.no_of_regions + 1;
          end     
      end
   end
end