clc
clear all
close all
x = [1 0 2.5 1.5];
h = [1 1 0.5 2];

y = conv(x,h)
circularSize = max(length(x), length(h));
linearSize = length(x)+length(h)-1;
Y = y(1:circularSize)
for i = 1:(linearSize - circularSize)
    Y(i) = Y(i) + y(circularSize +i);
end
stem(Y)
grid on
title('Circular Convolution from Linear Convolution');
xlabel('Sample Number (n)');
ylabel('Amplitude');
legend('102115252');