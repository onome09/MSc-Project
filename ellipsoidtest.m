hypercube_vertices = [-3 -2 -2; -3 -2 2; -3 2 -2; -3 2 2; 3 -2 -2; 3 -2 2; 3 2 -2; 3 2 2];
[vertices] = approximateConvexSetWithSupportFunction(hypercube_vertices,10);