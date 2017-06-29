function [array_of_vars] = varString2Array(variables)

variables = correctString(variables);
array_of_vars = strsplit(variables);
