function region_cell = addRegionBoundariesToRegionCell(region_cell, choices)
no_of_choices = size(choices,1);
e = size(choices,2);
f = max(choices(end));
for i = 1:no_of_choices
    region_cell = populatePossibleRegionsFromActiveHyperplanes(i*e^2-e^2+1,i*e^2,region_cell, choices(i,:), f);
end