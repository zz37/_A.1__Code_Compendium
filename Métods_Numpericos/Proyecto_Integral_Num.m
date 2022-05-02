x = 0:0.00017:0.001; % con tamaño de paso h = 0.0.00017
y = 0:0.00025:0.0015; % con tamaño de paso h = 0.00025
[X,Y] = meshgrid(x,y);
F = 15./(X.^2 + Y.^2 + 15^2).^(3/2);
I = cumtrapz(y,cumtrapz(x,F,2));

% figura 1
% figure(1)
% surf(X,Y,F)
% xlabel('X')
% ylabel('Y')
% zlabel('Z')

% figura 2
% figure(2)
% surf(X,Y,I,'FaceAlpha',0.5,'EdgeColor','none')

% figura 3
% figure(3)
% plot3(X(end),Y(end),I(end),'r*')

% figura 4; todas las figura juntas
surf(X,Y,F)
xlabel('X')
ylabel('Y')
zlabel('Z')
hold on
plot3(X(end),Y(end),I(end),'r*')
hold on
surf(X,Y,I,'FaceAlpha',0.5,'EdgeColor','none')
hold off
