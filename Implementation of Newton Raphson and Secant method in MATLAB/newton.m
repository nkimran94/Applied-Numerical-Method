function r = newton(f,df,x0,es,imax)
xr = x0;
ea = 10000;
iter =0;
fprintf('it \t \t xr \t f(xr) \t\t error \n');
while(ea> es &&iter<imax)
xrold = xr;
        F = feval(f,xrold);
        DF = feval(df,xrold);
xr = xrold - F/DF;
iter = iter +1;
if(xr ~= 0)
ea = abs((xr - xrold) / xr) *100;
end
fprintf('%d \t %f \t %f \t %f \n', iter,xr,F,ea);
end
    r = xr;
end
