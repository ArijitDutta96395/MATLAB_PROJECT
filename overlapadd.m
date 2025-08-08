h = [1, 1, 1]; % Impulse response
x = [3, -1, 0, 1, 3, 2, 0, 1, 2, 1]; % Input signal

% Break input signal into segments for overlap-add
x1 = [3, -1, 0, 0, 0];
x2 = [1, 3, 2, 0, 0];
x3 = [0, 1, 2, 0, 0];
x4 = [1, 0, 0, 0, 0];

h1 = [1, 1, 1, 0, 0]; % Padded impulse response
c = h1';

% Generate circularly shifted versions of h1 for convolution
for i = 1:4
    c = [c, circshift(h1', i)];
end

% Compute the convolution for each segment
y1 = c * x1';
y2 = c * x2';
y3 = c * x3';
y4 = c * x4';

% Combine results using overlap-add method
y= [y1(1),y1(2),y1(3),y1(4) + y2(1),y1(5) + y2(2), y2(3), y2(4)+ y3(1),y2(5)+ y3(2),y3(3),y3(4)+ y4(1),y3(5)+y4(2),y4(3)]; 

% Define time indices and ensure they match the output length
%   n = 0:(length(y) - 1); % Adjust length to match y
n= 0: length (x)+ length(h)-2;
% Plot the result
stem(n, y, 'filled'); % Use 'filled' for better visibility
title('Overlap-Add Method');
xlabel('n');
ylabel('Amplitude');
