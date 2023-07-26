% Two positive thin lenses are separated by a distance of 5.00 cm. 
% The focal lengths of the lenses are F1 = 10.0 cm and F2 = 20.0 cm. 
% Using ray tracing along with numerical methods, determine the power of the combination in 1/cm. 
% Express your answer with three significant figures.

% % Given parameters
% f1 = 15; % Focal length of lens 1 (cm)
% f2 = -20; % Focal length of lens 2 (cm)
% d = 25; % Separation distance between the lenses (cm)

% Given parameters
f1 = 10; % Focal length of lens 1 (cm)
f2 = 20; % Focal length of lens 2 (cm)
d = 5.0; % Separation distance between the lenses (cm)

% Calculate the ABCD matrix for the system
A1 = 1;
B1 = 0;
C1 = -1/f1;
D1 = 1;

A2 = 1;
B2 = d;
C2 = 0;
D2 = 1;

A3 = 1;
B3 = 0;
C3 = -1/f2;
D3 = 1;

ABCD =[A3, B3; C3, D3]*[A2, B2; C2, D2]*[A1, B1; C1, D1];

% Assign the resulting values to variables A, B, C, and D
A = ABCD(1, 1);
B = ABCD(1, 2);
C = ABCD(2, 1);
D = ABCD(2, 2);

% Display the resulting values
fprintf('A: %.3f\nB: %.3f\nC: %.3f\nD: %.3f\n', A, B, C, D);

n1  = 1;
n2 = 1;
% Display the resulting values
d1  = ((n1/n2)-D)/C;
% Display the resulting values
d2  = (1-A)/C;
fprintf('d1: %.3f\nd2: %.3f\n', d1, d2);


% Calculate the equivalent focal length (Feq)
Feq_inv = 1/f1 + 1/f2 - d/(f1*f2);
Feq = 1/Feq_inv;

% Calculate the power of the combination (P)
P = 1/Feq;

% Display the power with three significant figures
fprintf('Power of the combination: %.3f 1/cm\n', P);
fprintf('Combine Focal Length: %.3f cm\n', Feq);


BFL = Feq  + d2;
FFL = Feq  + d1;