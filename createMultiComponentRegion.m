function [region_with_functions] = createMultiComponentRegion(variables_string,varargin)
    s = nargin - 1;
    
    region_with_functions = cell(1,s);
    for i = 1:s
        region_with_functions{1,i} = createSymbolicFunction(variables_string,varargin{1,i});
    end