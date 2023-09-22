clc
clear all
close all
x = [1 0 2.5 1.5];
h = [1 1 0.5 2];
x1 = length(x);
h1 = length(h);

N = max(x1,h1);
x_ext = [x, zeros(1,N-x1)];
h_ext = [h, zeros(1,N-h1)];

y = zeros(1,N);
for i=1:N
    for j=1:N
        y(i) = y(i) + x_ext(i)*h_ext(mod((i-j),N)+1)
    end
end

figure
stem(y);
grid on
title("Circular Convolution");
xlabel("sample (n)")
ylabel("Amplitude")
legend()
