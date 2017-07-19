function output = noOfRegions(no_dimensions, no_hyperplanes)
output = 0;
for i = 0:no_dimensions
   output = output + nchoosek(no_hyperplanes,i);
end