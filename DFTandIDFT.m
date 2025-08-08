% Original sequence (time domain)
x = [1 1 0 0 0 0 1];   % Example time-domain sequence
N = length(x);      % Length of the sequence

% Compute the DFT of the original sequence
X = zeros(1, N);   % Initialize DFT output
for k = 0:N-1
    for n = 0:N-1
        X(k+1) = X(k+1) + x(n+1) * exp(-j * 2 * pi * k * n / N);  % DFT formula
    end
end

disp('DFT coefficients (frequency domain):');
disp(X);

% Compute the IDFT (Inverse DFT)
x_reconstructed = zeros(1, N);   % Initialize output sequence
for n = 0:N-1
    for k = 0:N-1
        x_reconstructed(n+1) = x_reconstructed(n+1) + X(k+1) * exp(j * 2 * pi * k * n / N);  % IDFT formula
    end
end
x_reconstructed = x_reconstructed / N;  % Normalize by dividing by N

% Display the reconstructed signal
disp('Reconstructed signal (time domain):');
disp(x_reconstructed);
