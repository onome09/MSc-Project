function [array_of_vars] = convertVariableStringToArray(variables)

variables = correctString(variables);
array_of_vars = strsplit(variables);
