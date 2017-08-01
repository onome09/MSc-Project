r1 = createSingleComponentRegion('x,y','y^2+3*x^2');
r2 = createSingleComponentRegion('x,y','y^2+x^2');
r3 = createSingleComponentRegion('x,y','3*y^4+3*x^2');
r4 = createSingleComponentRegion('x,y','3*y^4+x^2');
[hyperplanes,~,set_of_region_functions,region_info_cell] = createDomainWithRegions('x,y','x==0','y==0');
set_of_region_functions = insertRegionFunctionInfo(set_of_region_functions,r1,1);
set_of_region_functions = insertRegionFunctionInfo(set_of_region_functions,r2,2);
set_of_region_functions = insertRegionFunctionInfo(set_of_region_functions,r3,3);
set_of_region_functions = insertRegionFunctionInfo(set_of_region_functions,r4,4);

[xk,iteration]= optimiseSubgradientDescentMethod(set_of_region_functions,region_info_cell,hyperplanes,'x,y',[-5;0],0.01,0.1);


[hyperplanes,~,set_of_region_functions,region_info_cell] = createDomainWithRegions('x','x==4','x==-4');
r1 = createRegion('x,y,z','(-x)^(1/2) -1');
r2 = createRegion('x,y,z','(x)^2 +6*(x)+9');
r3 = createRegion('x,y,z','2*(x)^2 +17');
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
r1 = createSingleComponentRegion('x,y','x^2-x+y^2-6*y+13');
r2 = createSingleComponentRegion('x,y','x^2 - 4*x+13+y^2-6*y');
r3 = createSingleComponentRegion('x,y','x+13+y^2-6*y');
set_of_region_functions = insertRegionFunctionInfo(set_of_region_functions,r1,1);
set_of_region_functions = insertRegionFunctionInfo(set_of_region_functions,r2,2);
set_of_region_functions = insertRegionFunctionInfo(set_of_region_functions,r3,3);
[xk,iteration]= optimiseSubgradientDescentMethod(set_of_region_functions,region_info_cell,hyperplanes,'x,y',[5;-5],0.01,0.1);

[hyperplanes,~,set_of_region_functions,region_info_cell] = createDomainWithRegions('x,y','x==0','x==5');
r1 = createMultiComponentRegion('x,y','x^2-x+y^2-6*y+13','x^2-2*x+y^2-4*y+13');
r2 = createMultiComponentRegion('x,y','x^2 - 4*x+13+y^2-6*y','x^2 - 6*x+13+y^2-4*y');
r3 = createMultiComponentRegion('x,y','x+13+y^2-6*y','x+8+y^2-4*y');
set_of_region_functions = insertRegionFunctionInfo(set_of_region_functions,r1,1);
set_of_region_functions = insertRegionFunctionInfo(set_of_region_functions,r2,2);
set_of_region_functions = insertRegionFunctionInfo(set_of_region_functions,r3,3);
[xk,iteration]= optimiseVectorSubgradientDescentMethod(set_of_region_functions,region_info_cell,hyperplanes,'x,y',[5;-5],0.01,0.1);
