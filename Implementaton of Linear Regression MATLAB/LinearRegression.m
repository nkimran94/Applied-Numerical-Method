clc;
clear all;
close all;
%Ages of developer between 18 to 55
x = [18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55]
%Python Developer Salary by age
y = [20046, 17100, 20000, 24744, 30500, 37732, 41247, 45372, 48876, 53850, 57287, 63016, 65998, 70003, 70000, 71496, 75370, 83640, 84666, 84392, 78254, 85000, 87038, 91991, 100000, 94796, 97962, 93302, 99240, 102736, 112285, 100771, 104708, 108423, 101407, 112542, 122870, 120000]
 

n = 38;
 
scatter(x,y);
grid on;
%plot(x,y)
hold on;
 
%linear Regression Alogithm
sumx = 0;
sumy = 0;
sumxy = 0;
sumx2 = 0;
st = 0;
sr = 0;
for i = 1:n
    sumx = sumx+x(i);
    sumy = sumy+y(i);
    sumxy = sumxy + x(i) * y(i);
    sumx2 = sumx2 + x(i) * x(i);
end;
xm = sumx/n
ym = sumy/n;
 
a1 = (n*sumxy - sumx*sumy) / (n*sumx2 - sumx*sumx);
a0 = ym - a1*xm;
fprintf('the equation is: y = %.5f + %.5f x\n',a1,a0);
 
 
%Error Analysis of the linear fit:
 
fprintf('computations for an error analysis of the linear fit: \n');
fprintf('x\t y \t \t \t st \t \t \t sr \n');
 
for i  = 1:n
    st0 = (y(i) - ym)^2;
    sr0 = (y(i) - a1*x(i) - a0)^2;
    
    st = st+st0;
    sr = sr+sr0;
    fprintf('%d \t %.5f \t %.5f \t %.5f \n',x(i),y(i),st0,sr0);
end;
fprintf('--------------------------------------\n');
fprintf('%d \t %.5f \t %.5f \t %.5f \n',sumx,sumy,st,sr);

res_error = (ym - a0 - a1*xm)^2
syx = (sr/(n-2))^(0.5);
r2 = (st - sr)/st;

fprintf('sy/x = %.5f & r2 = %.5f & Res_error = %.5f',syx,r2,res_error);
 
%plotting the result
yr = a0 +a1.*x;
plot(x,yr);
