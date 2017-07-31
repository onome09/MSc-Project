r1 = createRegion('x','(-x)^(1/2) -1');
r2 = createRegion('x','x^2 +6*x+9');
r3 = createRegion('x','2*x^2 +17');
[hyperplanes,~,set_of_region_functions,region_info_cell] = createDomainWithRegions('x','x==4','x==-4');
set_of_region_functions = insertRegionFunctionInfo(set_of_region_functions,r1,1);
set_of_region_functions = insertRegionFunctionInfo(set_of_region_functions,r2,2);
set_of_region_functions = insertRegionFunctionInfo(set_of_region_functions,r3,3);
[xk,iteration]= optimiseSubgradientDescentMethod(set_of_region_functions,region_info_cell,hyperplanes,'x',-5,0.01,0.1);

[hyperplanes,~,set_of_region_functions,region_info_cell] = createDomainWithRegions('x,y,z','x+y+z==4','x+y+z==-4');
r1 = createRegion('x,y,z','(-x-y-z)^(1/2) -1');
r2 = createRegion('x,y,z','(x+y+z)^2 +6*(x+y+z)+9');
r3 = createRegion('x,y,z','2*(x+y+z)^2 +17');
set_of_region_functions = insertRegionFunctionInfo(set_of_region_functions,r1,1);
set_of_region_functions = insertRegionFunctionInfo(set_of_region_functions,r2,2);
set_of_region_functions = insertRegionFunctionInfo(set_of_region_functions,r3,3);

[hyperplanes,~,set_of_region_functions,region_info_cell] = createDomainWithRegions('x,y','x==0','x==5');
r1 = createRegion('x,y','x^2-x+y^2-6*y+13');
r2 = createRegion('x,y','x^2 - 4*x+13+y^2-6*y');
r3 = createRegion('x,y','x+13+y^2-6*y');
set_of_region_functions = insertRegionFunctionInfo(set_of_region_functions,r1,1);
set_of_region_functions = insertRegionFunctionInfo(set_of_region_functions,r2,2);
set_of_region_functions = insertRegionFunctionInfo(set_of_region_functions,r3,3);
[xk,iteration]= optimiseSubgradientDescentMethod(set_of_region_functions,region_info_cell,hyperplanes,'x,y',[5;-5],0.01,0.1);

