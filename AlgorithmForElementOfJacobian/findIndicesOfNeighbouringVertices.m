function [indices] = findIndicesOfNeighbouringVertices(index,Graph)

    g = table2array(Graph.Edges);
    indices = [g(g(:,1)==index,2);g(g(:,2)==index,1)];
    
