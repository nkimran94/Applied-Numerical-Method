clc;
clear all;
close all;
m = 4; % degree of polynomila
n = 10 %num of total data

x = [0 1 2 3 4 5 6 7 8 9];
y = [2.1 7.7 13.6 27.2 40.9 61.1 65.2 70.3 75.8 80.9];
xm = mean(x);
ym = mean(y);
XI = [];
for j = 1:2*m+1
    sum = 0;
    for i = 1:n
        sum = sum + power(x(i),j-1);
    end
    XI(j) = sum;
end
XIYI = []
for j = 1: m+1
    sum = 0;
    for i = 1:n
        sum = sum + power(x(i),j-1)*y(i);
    end
    XIYI(j) = sum;
end

A = zeros(m+1,m+1); %creating a matrix
idx = 1;
for i = 1:m+1
    for j = 1: m+1
        A(idx) = XI(i+j-1);
        idx = idx+1;
    end
end
B = transpose(XIYI)
%-------------------------------------------
%Gauss elimination to solve the system
n = m+1;

%forward elimination
for k = 1: n-1
    for i = k+1:n
        factor = A(i,k)/A(k,k);
        for j = 1:n
            A(i,j) = A(i,j)-factor*A(k,j);
        end
        B(i) = B(i) - factor*B(k);
    end
end

%back substitution
X  = zeros(1,n);
X(n) = B(n)/A(n,n);

for i = n-1: -1:1
    sum = B(i);
    for j = i+1:n
        sum = sum - A(i,j)*X(j);
    end
    X(i) = sum/A(i,i);
end
display(X);

%-----------------------------------------------
%polynomial equation
f = @(x) 3.3115-5.1417*x +7.4161*x.^2 - 1.1055*x.^3 + 0.0501*x.^4;
yy = f(x);
plot(x,y,'*');
hold on;
plot(x,yy,'r');

%-----------------------------------------------------

%Error analysis of the polynomial fit
st = 0;
sr = 0;
sumx = 0;
sumy = 0;
for i = 1:n
    sumx = sumx + x(i);
    sumy = sumy + y(i);
end
fprintf('Computations for an error analysis of the polynomial fit: \n');
fprintf('x \t y \t \t \t st \t \t \t sr \n');
for i = 1:n
    st0 = (y(i) - ym)^2;
    sr0 = (y(i) - 3.3115 + 5.1417*x(i) -7.4161*x(i)^2 + 1.1055*x(i)^3 - 0.0501*x(i)^4)^2;
    st = st + st0;
    sr = sr + sr0;
    fprintf('%d \t %.5f \t %.5f \t %.5f \n',x(i),y(i),st0,sr0);
 
end
 
fprintf('%d \t %.5f \t %.5f \t %.5f \n\n',sumx,sumy,st,sr);
syx = (sr/(n-2))^(0.5);
r2 = (st - sr)/st;
fprintf('sy/x = %.5f \t & \t r2 = %.5f',syx,r2);

