clc;
clear;
close all;

% Filter Parameters
N = 49; % Filter order (from earlier calculations)
wc1 = 0.3 * pi; % Lower cutoff frequency
wc2 = 0.6 * pi; % Upper cutoff frequency
beta = 4.533; % Kaiser window beta
fs = 10000; % Sampling frequency in Hz
omega = linspace(0, pi, 500); % Frequency grid

% Compute ideal impulse response (h_d[n])
n = -(N-1)/2 : (N-1)/2; % Symmetric range for filter length
h_d = zeros(1, N);
for i = 1:N
    if n(i) == 0
        h_d(i) = (wc2 - wc1) / pi; % At n=0
    else
        h_d(i) = (sin(wc2 * n(i)) - sin(wc1 * n(i))) / (pi * n(i));
    end
end

% Compute Kaiser window (w[n])
w = besseli(0, beta * sqrt(1 - (2 * n / (N - 1)).^2)) / besseli(0, beta);

% Compute final filter coefficients (h[n])
h = h_d .* w;

% Compute H(e^jw) using DTFT formula
H = zeros(1, length(omega));
for k = 1:length(omega)
    H(k) = sum(h .* exp(-1j * omega(k) * n));
end

% Plot magnitude response |H(e^jw)|
figure;
plot(omega * fs / (2 * pi), abs(H)); % Convert to Hz
title('Magnitude Response |H(e^{jw})|');
xlabel('Frequency (Hz)');
ylabel('|H(e^{jw})|');
grid on;

% Plot phase response arg(H(e^jw))
figure;
plot(omega * fs / (2 * pi), angle(H));
title('Phase Response arg(H(e^{jw}))');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
grid on;

% Display impulse response h[n]
figure;
stem(n, h, 'filled');
title('Impulse Response h[n]');
xlabel('n');
ylabel('h[n]');
grid on;
