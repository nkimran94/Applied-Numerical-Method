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
shading interp;