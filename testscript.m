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
aFullFunction1 = aFullFunction1.addFunction(Function('x,y','-x-y'));
aFullFunction2 = FullFunction;
aFullFunction2 = aFullFunction2.addFunction(Function('x,y','2*x+y'));
aFullFunction3 = FullFunction;
aFullFunction3 = aFullFunction3.addFunction(Function('x,y','3*x-y'));
aFullFunction4 = FullFunction;
aFullFunction4 = aFullFunction4.addFunction(Function('x,y','2*x-y'));
aFullFunction5 = FullFunction;
aFullFunction5 = aFullFunction5.addFunction(Function('x,y','x^2-y^2'));
aFullFunction6 = FullFunction;
aFullFunction6 = aFullFunction6.addFunction(Function('x,y','x^2+y^2'));
aFullFunction7 = FullFunction;
aFullFunction7 = aFullFunction7.addFunction(Function('x,y','x^2-y^2'));
%Defining info about newly made regions with the vector functions
%and testing the other functions
aRegion1 = Region('x,y',aFullFunction1);
aRegion2 = Region('x,y',aFullFunction2);
aRegion3 = Region('x,y',aFullFunction3);
aRegion4 = Region('x,y',aFullFunction4);
aRegion5 = Region('x,y',aFullFunction5);
aRegion6 = Region('x,y',aFullFunction6);
aRegion7 = Region('x,y',aFullFunction7);

%aRegion1.flatten;
%aRegion2.flatten;
%aRegion1.calculateLimitOfDerivative;
%aRegion2.calculateLimitOfDerivative;
%making all Regions defined by the hyperplanes of the domain
aFullRegion = FullRegion(aDomain);
for i = 1:size(aFullRegion.regions,1)
    aFullRegion.showEnclosingHyperPlanesOfARegion(i);
    disp('------------------------')
end
%Inserting the function info for each region
aFullRegion = aFullRegion.insertRegionFunctionInfo(aRegion5,6);
aFullRegion = aFullRegion.insertRegionFunctionInfo(aRegion6,7);
aFullRegion = aFullRegion.insertRegionFunctionInfo(aRegion7,5);
aFullRegion = aFullRegion.insertRegionFunctionInfo(aRegion4,4);
aFullRegion = aFullRegion.insertRegionFunctionInfo(aRegion2,2);
aFullRegion = aFullRegion.insertRegionFunctionInfo(aRegion1,1);
aFullRegion = aFullRegion.insertRegionFunctionInfo(aRegion3,3);
%get the generalised Jacobian using the convexhulln function
%aFullRegion.getJacobian
obj = ObjFunction(aFullRegion);
