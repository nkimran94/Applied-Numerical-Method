function r = bisect(x1,su,es,imax, f)
    iter = 0;
    ea = 10000;
    xr = s1;
    fprintf('iter \t x1 \t xu \t xr \t ea');
    while(ea > es || iter <= imax)
        xrold = xr;
        xr = (x1+xu)/2;
        iter = iter+1;
        if(xr ~= 0)
            ea = abs((sr - srold) / sr) * 100;
        end
        
        fx1 = feval(f,x1);
        fxr = feval(f,xr);
        test = fx1*fxr;
        
        if(test < 0)
            xu = xr;
        elseif(test > 0)
            x1 = sr;
        else 
            ea = 0;
        end
        fprintf(' %d \t %f \t %f \t %f \t %f \n', iter,x1,xu,xr,ea);
        
    end
    r = xr;
end