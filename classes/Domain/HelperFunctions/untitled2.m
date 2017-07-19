h1 = HyperPlane('x,y','x == 0');
h2 = HyperPlane('x,y','y == 0');
h3 = HyperPlane('x,y','x+y == 5');
d1 = Domain('x,y',1);
d1 = d1.addHyperplane(h1);
d1 = d1.addHyperplane(h2);
d1 = d1.addHyperplane(h3);