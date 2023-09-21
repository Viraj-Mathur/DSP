clc
clear all
close all
x = input("Enter sequence: ");
N = length(x);
X = zeros(1,N);
for k = 0:N-1
    for n = 0:N-1
        X(k+1) = X(k+1) + (1/N)*x(n+1).*exp((j*2*pi*k*n)/N)
    end
end

k = 1:N;
disp(X)
abs(X)
angle(X)
subplot(3,2,1)
stem(k,abs(X))
xlabel('n')
ylabel('|x[n]|')

title("Magnitude Spectrum of IDFT")

subplot(3,2,2)
stem(k, angle(X))
xlabel('n')
ylabel('phi x[n]')
title("Phase Spectrum")