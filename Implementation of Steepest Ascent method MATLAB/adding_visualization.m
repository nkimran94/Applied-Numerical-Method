clc;
clear all;
close all;
%declare function
func = @(x,y) 2.*x.*y + 2.*x - x.^2 - 2.*y.^2;

x = linspace(-5,5,100); %create a linspace in x direction
y = linspace(-5,5,100); %create a linspace in y direction
[X,Y] = meshgrid(y,x); %now create a plane or mesh using those x,y values,that is actually a matrix
F = func(X,Y); %now pass that [X,Y] matrix into our f(x,y) function
surf(x,y,F');
%dfdx = @(x,y) 2*y +2 - 2*x;
%dfdy = @(x,y) 2*x - 4*y;

%initial guess
x0 = 1;
y0 = -1;

%algorithm parameters
dx = 0.001;
dy = 0.001;
alpha = 0.01;
tol = 1e-3;
g = [inf,inf];

while norm(g) > tol 
    % norm(g) = sqrt(gx^2 +gy^2)
    %visualize
    imagesc(x,y,F');
    axis equal tight;
    drawnow;
    hold on;
    plot(x0,y0,'ok');
    hold off;
    pause(0.1);
    
    %clculate gradients
    f1 = func(x0-dx/2,y0);
    f2 = func(x0+dx/2,y0);
    gx = (f2-f1)/dx;
    
    f1 = func(x0,y0-dy/2);
    f2 = func(x0,y0+dy/2);
    gy = (f2-f1)/dy;
    
    g = [gx;gy];
    
    %update position of guess
    x0 = x0 + alpha*gx;
    y0 = y0 + alpha*gy;
end
%Report the answer
[x0, y0]