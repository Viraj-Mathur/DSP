% Define parameters
fs = 8000;
delay = 2000;  % Increased delay further
M = 256;       % Increased filter length
mu = 0.01;     % Increased step size

% Load the audio file
[x, fs] = audioread('StarWars3.wav');

% Ensure the audio is mono
if size(x, 2) == 2
    x = mean(x, 2);
end

% Simulate the echo
echo = [zeros(delay, 1); 1.5 * x(1:end - delay)];  % Increased echo amplitude further

% Create an FIR filter with initial coefficients
h = zeros(M, 1);

% Initialize variables for storing the output and error signals
y = zeros(size(x));
e = zeros(size(x));

% Initialize x_n outside the loop
x_n = zeros(M, 1);

% AEC loop
for n = 1:length(x)
    x_n = [x(n); x_n(1:M-1)];
    y(n) = h' * x_n;
    e(n) = echo(n) - y(n);

    % Update the FIR filter coefficients using the LMS algorithm
    h = h + 2 * mu * e(n) * x_n;
end

% Remove the echo from the noisy input
output_signal = x - e;

% Write the filtered echo signal to a WAV file
audiowrite('output.wav', output_signal, fs);
figure;
subplot(3, 1, 1); plot(x); title('Original Signal');
subplot(3, 1, 2); plot(x + echo); title('Noisy Signal with Echo');
subplot(3, 1, 3); plot(output_signal); title('Output Signal without Echo');