% definir primero el vector del intervalo de 0 a 0.008 para y
%       Resolver la integral de forma numérica
%       0.008
%       ⌠      dx
%       |   -------
%       ⌡   (x^2 + 15^2)^(3/2)
%       0
 
 x = [0 0.001 0.002 0.003 0.004 0.005 0.006 0.007 0.008]; % intervalo de x [0,0.008]
 
 y = (1./(x.^2 clc+ 225).^(3/2))% f(x) -> función de y
 
 y2 = y * -1
 
 Trapecio = trapz(x,y) % cálculo de la integral pormedio del método del
                       % del trapezoide