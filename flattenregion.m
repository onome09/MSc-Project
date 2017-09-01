function [sym_function, function_string] = flattenregion(aRegion,variables_string)
      flattened_variable_string = createFlattenedVariableString(createSymbolicVariables(variables_string), size(aRegion,2));
      r = varString2Array(flattened_variable_string);
      function_string = createFlattenedFunctionString(varString2Array(variables_string),r,aRegion, 2);
      sym_function = createSymbolicFunction(flattened_variable_string,function_string);
