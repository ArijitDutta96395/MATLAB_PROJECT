syms a n w z; % Declare symbolic variables

% Compute and display the Z-transform of a^n
x1 = ztrans(a^n);
disp('Z-transform of a^n:');
pretty(x1);

% Compute and display the Z-transform of sin(w*n)
x2 = ztrans(sin(w*n));
disp('Z-transform of sin(w*n):');
pretty(x2);

% Compute and display the Z-transform of cos(w*n)
x3 = ztrans(cos(w*n));
disp('Z-transform of cos(w*n):');
pretty(x3);

% Given discrete-time sequence x[n]
x = [2 4 5 7 0 1]; % Sequence x[n]

% Initialize summation for Z-transform of x[n]
s = 0; 
for i = -2:3
    s = s + (x(i + 3) * z^(-i)); % Corrected indexing and summation
end

% Display the symbolic expression of the Z-transform of x[n]
disp('Z-transform of x[n]:');
pretty(s);
