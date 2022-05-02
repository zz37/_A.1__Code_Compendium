% script de integración numérica
fun = @(x,y) 1000./(x.^2 + y.^2 + 1000^2).^(3/2)

% q = integral2(fun,xmin,xmax,ymin,ymax)

q = integral2(fun,0,0.075,0,0.08)

