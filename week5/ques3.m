% Clear workspace and command window
clear;
clc;
syms d r;

% ABCD matrix for lens
lens_matrix = [1, 0; -2/r, 1];

% ABCD matrix for free space propagation
propagation_matrix = [1, d; 0, 1];

% Total ABCD matrix for one full round trip through the system
ABCD = lens_matrix * propagation_matrix * lens_matrix*propagation_matrix;

% Print the top left element of the ABCD matrix
disp(ABCD(2,2));


