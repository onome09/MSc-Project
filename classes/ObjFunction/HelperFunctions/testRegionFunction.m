function f = testRegionFunction(x,region_function,symbolic_variables)

f = subs(region_function, symbolic_variables, x');
