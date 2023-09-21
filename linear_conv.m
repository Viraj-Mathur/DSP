clc
clear all
close all
x1 = input("Enter x1(n): ");
X1 = length(x1);
x2 = input("Enter x2(n): ");
X2 = length(x2);

N = X1+X2 - 1
l = 1:N
X1 = [x1 zeros(1,N)]
X2 = [x2 zeros(1,N)]

for i = 1:N
    y(i) = 0;
    for j = 1:N
        if(i-j+1 > 0)
            y(i) = y(i) + X1(j).*X2(i-j+1)
        else
        end
    end
end
disp(y)
stem(l,y)