clc;
clear all;
close all;
%declare function
func = @(x,y) 2.*x.*y + 2.*x - x.^2 - 2.*y.^2;

dfdx = @(x,y) 2*y +2 - 2*x;
dfdy = @(x,y) 2*x - 4*y;

%initial guess
x0 = 1;
y0 = -1;

%algorithm parameters
dx = 0.001;
dy = 0.001;
alpha = 0.1;
tol = 1e-3;
g = [inf,inf];

while norm(g) > tol % norm(g) = sqrt(gx^2 +gy^2)
    %clculate gradients
    gx = dfdx(x0,y0);
    gy = dfdy(x0,y0);
    g = [gx;gy];
    
    %update position of guess
    x0 = x0 + alpha*gx;
    y0 = y0 + alpha*gy;
end

%Report the answer
[x0, y0]