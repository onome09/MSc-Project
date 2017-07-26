%uses the hyperplanes in varagin to cfreate cell of regions
function [cell_of_hyperplanes,hyperplane_functions,domain_with_regions,info_on_each_region] = createDomainWithRegions(variables_string,varargin)    
    hyperplane_functions = initialiseHyperPlanesIntoCell(variables_string,varargin);
    variables = createSymbolicVariables(variables_string);
    [domain_with_regions,info_on_each_region] = calculateRegions(variables,hyperplane_functions);
    cell_of_hyperplanes = varargin;
    
        