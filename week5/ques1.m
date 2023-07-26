% Given focal lengths
f1 = 20; % in cm
f2 = 40; % in cm
F = 16;

% Symbolic variables
syms d

% Lensmaker's formula
%1/F = 1/f1 + 1/f2 - (d/(f1 * f2));
d = (1/F - (1/f1 + 1/f2));

