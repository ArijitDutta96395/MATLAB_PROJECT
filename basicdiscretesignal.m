n = -10:10; % Range from -10 to 10
% Compute the unit step function using bitwise operator
u_n = (n >= 0) & 1; % Bitwise AND to convert boolean to 1/0
% Plot the discrete-time unit step function
subplot(3,3,1);
stem(n, u_n, 'filled');
title('Discrete-Time Unit Step Function');
xlabel('n');
ylabel('u[n]');
grid on;


n = -10:10; % Range from -10 to 10
% Compute the unit impulse function using bitwise operator
u_n = (n == 0) & 1; % Impulse at n = 0, else 0
% Plot the discrete-time unit impulse function
subplot(3,3,2);
stem(n, u_n, 'filled');
title('Discrete-Time Unit Impulse Function');
xlabel('n');
ylabel('delta[n]');
grid on;


n = -10:10; % Range from -10 to 10
% Compute the unit ramp function using bitwise operator
r_n = n .* (n >= 0); % Ramp function: n for n >= 0, 0 for n < 0
% Plot the discrete-time unit ramp function
subplot(3,3,3);
stem(n, r_n, 'filled');
title('Discrete-Time Unit Ramp Function');
xlabel('n');
ylabel('r[n]');
grid on;



n = -10:10; % Range from -10 to 10
% Compute the sine function using bitwise operator
sine_n = sin(n) .* ((n >= -10) & (n <= 10)); % Sine function for n in range [-10, 10]
% Plot the discrete-time sine function
subplot(3,3,4);
stem(n, sine_n, 'filled');
title('Discrete-Time Sine Function');
xlabel('n');
ylabel('sin[n]');
grid on;



n = -10:10; % Range from -10 to 10
% Compute the cosine function using bitwise operator
cosine_n = cos(n) .* ((n >= -10) & (n <= 10)); % Sine function for n in range [-10, 10]
% Plot the discrete-time sine function
subplot(3,3,5);
stem(n, cosine_n, 'filled');
title('Discrete-Time Cosine Function');
xlabel('n');
ylabel('sin[n]');
grid on;



n = -10:10; % Range from -10 to 10
% Compute the parabolic function using bitwise operator
parabola_n = n.^2 .* (n >= -10 & n <= 10); % Parabola: n^2 for n in range [-10, 10]
% Plot the discrete-time parabolic function
subplot(3,3,6);
stem(n, parabola_n, 'filled');
title('Discrete-Time Parabolic Function');
xlabel('n');
ylabel('n^2');
grid on;



n = -10:10; % Range from -10 to 10
% Parameters for the Gaussian function
mu = 0;   % Mean
sigma = 2; % Standard deviation
% Compute the Gaussian function using bitwise operator
gaussian_n = exp(-(n - mu).^2 / (2 * sigma^2)) .* ((n >= -10) & (n <= 10)); 
% Plot the discrete-time Gaussian function
subplot(3,3,7);
stem(n, gaussian_n, 'filled');
title('Discrete-Time Gaussian Function');
xlabel('n');
ylabel('Gaussian[n]');
grid on;



n = -10:10;  % Range from -10 to 10
% Initialize the signum function array
signum = zeros(size(n));
% Using bitwise operator to define signum function
for i = 1:length(n)
    if n(i) == 0
        signum(i) = 0; % sign(0) = 0
    else
        % Bitwise check to see if n(i) is positive or negative
        if n(i) > 0
            signum(i) = 1;  % Positive numbers get signum 1
        else
            signum(i) = -1; % Negative numbers get signum -1
        end
    end
end
% Plot the signum function
subplot(3,3,8);
stem(n, signum, 'filled');
xlabel('n');
ylabel('signum(n)');
title('Discrete-Time Signum Function');
grid on;



n = -10:10;  % Range from -10 to 10
% Initialize the sinc function array
sinc_val = zeros(size(n));
% Define the sinc function with conditional for n = 0
for i = 1:length(n)
    if n(i) == 0
        sinc_val(i) = 1; % sinc(0) = 1
    else
        % Calculate the sinc function value
        sinc_val(i) = sin(pi * n(i)) / (pi * n(i));
    end
end
% Plot the sinc function
subplot(3,3,9);
stem(n, sinc_val, 'filled');
xlabel('n');
ylabel('sinc(n)');
title('Discrete-Time Sinc Function');
grid on;



n = -10:10;  % Range from -10 to 10
% Initialize the triangular pulse function array
triangular_pulse = zeros(size(n));

% Using bitwise operator to define the triangular pulse
for i = 1:length(n)
    % Scalar logic with '&' for checking the range
    if n(i) >= 0 & n(i) <= 5
        triangular_pulse(i) = n(i) / 5;  % Increasing part of the pulse
    elseif n(i) > 5 & n(i) <= 10
        triangular_pulse(i) = (10 - n(i)) / 5;  % Decreasing part of the pulse
    else
        triangular_pulse(i) = 0;  % Outside the pulse range, value is 0
    end
end
% Plot the triangular pulse function
stem(n, triangular_pulse, 'filled');
xlabel('n');
ylabel('Amplitude');
title('Discrete-Time Triangular Pulse Function');
grid on;



