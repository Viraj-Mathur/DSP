clear all
close all
%rectangular function

t=-10:10
y = ones(1,21);
subplot(4,2,1)
stem(t,y)
xlabel('time');
ylabel('amplitude')
title("rect function - time domain")

[a,b] = freqz(y,2048);
a = abs(a)/max(a);
b = b./max(b);
a = 20*log(a)
subplot(4,2,2)
plot(b,a);
title("Freq domain")

xlabel('time');
ylabel('amplitude')

% hanning function

n = linspace(0,1,24)
p = 0.5-0.5*cos(n*2*pi)
subplot(4,2,3)
plot(n,p)
xlabel("time");
ylabel("amplitude");
title("Hanning Window Time Domain")
[a,b] = freqz(y,2048);
a = abs(a)/max(a);
b = b./max(b);
a = 20*log(a)
subplot(4,2,4)
plot(b,a);
title("Freq domain")

xlabel('time');
ylabel('amplitude')

% hamming 
n=linspace(0,1,24)
y=0.54-0.46*cos(n*2*pi)
subplot(4,2,5)

plot(n,y)
xlabel("time")
ylabel("amplitude")
legend("102115249")
title("hamming window time domain")


[a,b]=freqz(y,1,2048)
a=abs(a)/max(a)
b=b./max(b)
a=20*log(a)
subplot(4,2,6)
plot(b,a)
xlabel("time")
ylabel("amplitude")
legend("102115249")
title("hamming window time domain")

% blackman

N = 25;  % Number of points in the window
alpha = 0.16;  % Blackman window parameter (typical value)

% Generate Blackman window
n = linspace(0,N)
w = 0.42 - 0.5 * cos(2 * pi * n / (N - 1)) + 0.08 * cos(4 * pi * n / (N - 1));

% Plot the Blackman window
subplot(4,2,7)
plot(n, w);
title('Blackman Window');
xlabel('Sample Index');
ylabel('Amplitude');
xlabel('time');
ylabel('amplitude');
legend("102115249")
title('Blackman function (time domain)');

[a,b]=freqz(y,1,2048);
a =abs(a)/max(a);
b=b./max(b);
a=20*log(a)
subplot(4,2,8)
plot(b,a);
title('frequency domain');
xlabel('frequency');
ylabel('amplitude');
legend("102115249");
