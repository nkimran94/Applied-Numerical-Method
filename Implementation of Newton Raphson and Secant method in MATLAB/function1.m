f = @(x) cos(x) - 3*x +1;
df = @(x) -sin(x) - 3; 
 x = 0:0.01:0.5*pi;
 y = feval(f,x);
 plot(x,y);
xlabel('x');
ylabel('y');
 grid on;


 x0 = 1;
%xu = 0;
 es = 0.001;
imax = 10;
 r = newton(f,df,x0,es,imax);

disp(r);
