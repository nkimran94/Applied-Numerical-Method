func = @(x) x.^3 - 6* x.^2 + 4*x + 12;
 x = -2:0.1:6;
 y = feval(func,x);
 %plot(x,y);
 xlabel('x');
 ylabel('y');
 %grid on;
 
 
 x1 = -2;
 xu = 0;
 es = 0.01;
 imax = 10;
 r = bisect(x1,xu);
 
 
 
 disp(r);