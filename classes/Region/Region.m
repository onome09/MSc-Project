classdef Region
   properties
      variable_string
      functions
      function_strings
      symbolic_variables
   end
   methods
      function r = Region(string_of_vars, aFullFunction)
          r.symbolic_variables = createSymbolicVariables(string_of_vars);
          r.functions = aFullFunction.Functions;
          r.function_strings = aFullFunction.function_strings;
          r.variable_string = string_of_vars;         
      end
      function r = equals(obj, aRegion)
        r = 0;
            if (~strcmp(obj.variable_string,aRegion.variable_string))
                return
            end
            if (size(obj.function_strings,2) ~= size(aRegion.function_strings,2))
                return
            end
            for i = 1:size(obj.function_strings,2)  
                if (~strcmp(obj.function_strings{1,i},aRegion.function_strings{1,i}))
                    return
                end
            end
        r = 1;
      end
      function r = flatten(obj)
          flattened_variable_string = createFlattenedVariableString(obj.symbolic_variables, size(obj.functions,2));
          r = varString2Array(flattened_variable_string);
          r = createFlattenedFunctionString(varString2Array(obj.variable_string),r,obj.function_strings, size(obj.symbolic_variables,2));
          r = Function(flattened_variable_string,r);
      end
      
      function r = calculateLimitOfDerivative(obj,aPoint)   
            aPoint.variables
            r = jacobian(obj.functions,sym(obj.symbolic_variables));
            for i = 1:size(obj.symbolic_variables,2) 
                if nargin < 2
                    r = limit(r,obj.symbolic_variables(1,i),0);
                else
                    r = limit(r,obj.symbolic_variables(1,i),aPoint.variables(i,1));
                end
            end
      end
   end
end
