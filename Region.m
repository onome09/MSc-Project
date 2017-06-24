classdef Region
   properties
      variable_string
      functions
      symbolic_variables
   end
   methods
      function r = Region(string_of_vars, aFullFunction)
          r.symbolic_variables = createSymbolicVariables(string_of_vars);
          r.functions = aFullFunction.Functions;
          r.variable_string = string_of_vars;
          
      end
      
      function r = flatten(obj)
          flattened_variable_string = createFlattenedVariableString(obj.symbolic_variables, size(obj.functions,2));
          r = varString2Array(flattened_variable_string);
          r = createFlattenedFunctionString(varString2Array(obj.variable_string),r,obj.functions, size(obj.symbolic_variables,2));
          r = Function(flattened_variable_string,r);
      end
   end
end
