classdef Equality
   properties
      symbolic_equality_function
      symbolic_variables
      lessThan
      greaterThan
   end
   methods
      function obj = Equality(variables, equality_string)
        obj.lessThan = strrep(char(equality_string),'==','<');
        obj.greaterThan = strrep(char(equality_string),'==','>');
        obj.symbolic_variables = variables;
      end
      function obj = getRandomLessThan(obj)
        
      end   
      function obj = getRandomGreaterThan(obj)

      end 
   end
end