f = @(x) cos(x) +2*sin(x) + x; 
x = 0:0.01:0.5*pi;
y = feval(f,x);
plot(x,y);
xlabel('x');
ylabel('y');
grid on;


es = 0.001;
imax = 10;
x = 1;
r = secant(f,x,es,imax);
