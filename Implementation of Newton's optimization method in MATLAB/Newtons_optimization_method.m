

f = @(x) 4*x - 1.8*x^2 +1.2*x^3 - 0.3 * x^4;
df = @(x) 4 - 3.6*x +3.6*x^2 - 1.2*x^3;
ddf = @(x) -3.6 +7.2*x - 3.6*x^2;
%f = @(x) 2*sin(x) - (x^2/10);
%df = @(x) 2*cos(x) - (x/5);
%ddf = @(x) -2*sin(x) - 1/5;
x = 2.5;
iter = 0;
imax = 25;
es = 0.000001;
DF = 10000;
fprintf('iter \t x\t\t F \t\t\t\t DF \t\t DDF \n');

while(abs(DF) > es && iter < imax)
    F = feval(f,x);
    DF = feval(df,x);
    DDF = feval(ddf,x);
    x = x - DF/DDF;
    iter = iter+1;
    fprintf('%d \t %f \t %f \t %f \t %f \n', iter,x,F,DF,DDF);
end


for i = 0:3
    F = feval(f,x);
    DF = feval(df,x);
    DDF = feval(ddf,x);
end
x = 0:0.1:3;
plot(x,F);
hold on
plot(x,DF);
hold on
Plot(x,DDF);
hold off
