clc
clear all
close all

% Input signals
x = input("Enter x: ");
h = input("Enter h: ");

% Determine the length for circular convolution
N = max(length(x), length(h));

% Perform DFT for x
X = zeros(1, N);
for k = 1:N
    for n = 1:N
        X(k) = X(k) + x(n) * exp(-1j * 2 * pi * (n - 1) * (k - 1) / N);
    end
end

% Perform DFT for h
H = zeros(1, N);
for k = 1:N
    for n = 1:N
        H(k) = H(k) + h(n) * exp(-1j * 2 * pi * (n - 1) * (k - 1) / N);
    end
end

% Perform element-wise multiplication to get Y (frequency-domain result)
Y = X .* H;

% Perform IDFT to get circular convolution result y
y = zeros(1, N);
for n = 1:N
    for k = 1:N
        y(n) = y(n) + Y(k) * exp(1j * 2 * pi * (n - 1) * (k - 1) / N);
    end
    y(n) = y(n) / N;
end

disp("Circular Convolution using DFT and IDFT")
disp(y)
figure
stem(1:N, y)

% Note: The code assumes that you have the correct values for x and h.
