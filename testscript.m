%making functions
aFunction1 = Function('x,y','x');
aFunction2 = Function('x,y','-y');
aFunction3 = Function('x,y','2*x');
aFunction4 = Function('x,y','y');

%making hyperplanes
aHyperPlane1 = HyperPlane('x,y','x=0');
aHyperPlane2 = HyperPlane('x,y','y=0');
%making domain and adding hyperplanes 
aDomain = Domain('x,y', 2);
aDomain = aDomain.addHyperplane(aHyperPlane1);
aDomain = aDomain.addHyperplane(aHyperPlane2);

%making vector functions
aFullFunction1 = FullFunction;
aFullFunction1 = aFullFunction1.addFunction(aFunction1);
aFullFunction1 = aFullFunction1.addFunction(aFunction2);
aFullFunction2 = FullFunction;
aFullFunction2 = aFullFunction2.addFunction(aFunction3);
aFullFunction2 = aFullFunction2.addFunction(aFunction4);

%Defining info about newly made regions with the vector functions
aRegion1 = Region('x,y',aFullFunction1);
aRegion2 = Region('x,y',aFullFunction2);
aRegion1.flatten;
aRegion2.flatten;
aRegion1.calculateLimitOfDerivative;
aRegion2.calculateLimitOfDerivative;
%making all Regions defined by the hyperplanes of the domain
aFullRegion = FullRegion(aDomain);
for i = 1:size(aFullRegion.regions,1)
    aFullRegion.showEnclosingHyperPlanesOfARegion(i);
    disp('------------------------')
end


