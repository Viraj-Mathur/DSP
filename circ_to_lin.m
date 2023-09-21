clc
clear all
close all
x = [1 0 2.5 1.5];
h = [1 1 0.5 2];

linearSize = length(x) + length(h) -1;

x_pad = [x,zeros(1,linearSize - length(x))];
h_pad = [h, zeros(1, linearSize - length(h))];
circ_conv = cconv(x_pad, h_pad, linearSize);
y_linear = circ_conv(1:linearSize);
stem(y_linear)
grid on
title('Linear Convolution from Circular Convolution with Zero-Padding');
xlabel('Sample Number (n)');
ylabel('Amplitude');
legend('102115252');

