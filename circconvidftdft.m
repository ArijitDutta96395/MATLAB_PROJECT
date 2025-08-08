x = [1 0 1 0]; % Input sequence
N = 4; % Number of points for FFT
X = fft(x, N); % Compute FFT of input sequence
h = [0 1 0 1]; % Impulse response
H = fft(h, N); % Compute FFT of impulse response
Y = X .* H; % Perform element-wise multiplication in the frequency domain
y = ifft(Y); % Compute the inverse FFT (no division by N is necessary)

disp(X);
disp(H);
disp(Y);
disp(y); % Display the result
