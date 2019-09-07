clc;
close all;
clear all;
A = [3, -0.1, -0.2;
    0.1, 7, -0.3;
    0.3, -0.2, 10];
B = [7.85;
    -19.3;
    71.4];
n = 3;

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
disp(X)