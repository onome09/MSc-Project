%making functions
aFunction1 = Function('x,y','x');
aFunction2 = Function('x,y','-y');
aFunction3 = Function('x,y','2*x');
aFunction4 = Function('x,y','y');

%making hyperplanes
aHyperPlane1 = HyperPlane('x,y','x=0');
aHyperPlane2 = HyperPlane('x,y','y=0');
aHyperPlane3 = HyperPlane('x,y','x+y=5');
%making domain and adding hyperplanes 
aDomain = Domain('x,y', 1);
aDomain = aDomain.addHyperplane(aHyperPlane1);
aDomain = aDomain.addHyperplane(aHyperPlane2);
aDomain = aDomain.addHyperplane(aHyperPlane3);
aDomain = aDomain.calculateRegions;
%making vector functions
aFullFunction1 = FullFunction;
aFullFunction1 = aFullFunction1.addFunction(aFunction1);
%aFullFunction1 = aFullFunction1.addFunction(aFunction2);
aFullFunction2 = FullFunction;
aFullFunction2 = aFullFunction2.addFunction(aFunction3);
%aFullFunction2 = aFullFunction2.addFunction(aFunction4);

%Defining info about newly made regions with the vector functions
%and testing the other functions
aRegion1 = Region('x,y',aFullFunction1);
aRegion2 = Region('x,y',aFullFunction2);
%aRegion1.flatten;
%aRegion2.flatten;
aRegion1.calculateLimitOfDerivative;
aRegion2.calculateLimitOfDerivative;
%making all Regions defined by the hyperplanes of the domain
aFullRegion = FullRegion(aDomain);
for i = 1:size(aFullRegion.regions,1)
    aFullRegion.showEnclosingHyperPlanesOfARegion(i);
    disp('------------------------')
end
%Inserting the function info for each region
aFullRegion = aFullRegion.insertRegionFunctionInfo(aRegion2,1);
aFullRegion = aFullRegion.insertRegionFunctionInfo(aRegion2,2);
aFullRegion = aFullRegion.insertRegionFunctionInfo(aRegion2,3);
aFullRegion = aFullRegion.insertRegionFunctionInfo(aRegion1,4);
aFullRegion = aFullRegion.insertRegionFunctionInfo(aRegion1,5);
aFullRegion = aFullRegion.insertRegionFunctionInfo(aRegion1,6);
aFullRegion = aFullRegion.insertRegionFunctionInfo(aRegion2,7);
%get the generalised Jacobian using the convexhulln function
aFullRegion.getJacobian
obj = ObjFunction(aFullRegion);
