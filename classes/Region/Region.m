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
      
      function r = flatten(obj)
          flattened_variable_string = createFlattenedVariableString(obj.symbolic_variables, size(obj.functions,2));
          r = varString2Array(flattened_variable_string);
          r = createFlattenedFunctionString(varString2Array(obj.variable_string),r,obj.function_strings, size(obj.symbolic_variables,2));
          r = Function(flattened_variable_string,r);
      end
      
      function r = calculateLimitOfDerivative(obj)            
            r = jacobian(obj.functions,sym(obj.symbolic_variables));
            for i = 1:size(obj.symbolic_variables,2)        
                r = limit(r,obj.symbolic_variables(1,i),0);
            end
      end
   end
end
