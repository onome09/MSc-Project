classdef ObjFunction
   properties
      function_mapping
      jacobian_matrices
   end
   methods
      function obj = ObjFunction(aFullRegionorDefinedRegion)
         obj.function_mapping = aFullRegionorDefinedRegion;
         obj.jacobian_matrices = cell(0);
      end 
     
      function obj = getJacobian(obj)
          
      end
   end
end