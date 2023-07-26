% Given values
lambda = 0.6e-6;  % Wavelength in meters
z_0 = 384.4e6;     % Focal length in meters

% Calculate the beam waist w_o
w_0 = sqrt((lambda * z_0) / pi);

% Calculate the diameter of the mirror on Earth
D = 2 * w_0;

% Display the result
disp(D);
%% MATLAB code to calculate the far-field divergence angle
%https://youtu.be/MU4eOJw2sBQ?t=558
% Given parameters
lambda = 632.8e-9; % Wavelength in meters
w = 0.5e-3; % Beam waist in meters

% Calculate the far field divergence angle
theta = lambda / (pi * w);

% Display the result in radians
disp(theta);

%% MATLAB code to calculate the Rayleigh range
% Given parameters
lambda = 632.8e-9; % Wavelength in meters
w = 0.5e-3; % Beam waist in meters

% Calculate the Rayleigh range
z_0 = (pi * w^2) / lambda;

% Display the result in meters
disp(z_0);

%% MATLAB code to calculate the beam radius at 2z_0
% Given parameters
lambda = 632.8e-9; % Wavelength in meters
w_0 = 0.5e-3; % Beam waist in meters
z_0 = (pi * w_0^2) / lambda; % Rayleigh range

% Calculate the beam radius at 2z_0
z = 2 * z_0;
w = w_0 * sqrt(1 + (z^2 / (z_0^2)));

% Convert the result to millimeters
w_mm = w * 1000;

% Display the result in millimeters
disp(w_mm);

%% MATLAB code to calculate the radius of curvature at z_0
% Given parameters
lambda = 632.8e-9; % Wavelength in meters
w_0 = 0.5e-3; % Beam waist in meters
z_0 = (pi * w_0^2) / lambda; % Rayleigh range

% Calculate the radius of curvature at z_0
z = z_0;
R = z * (1 + ((z_0^2) / (z^2)));

% Display the result in meters
disp(R);

%% MATLAB code to calculate the peak intensity at the waist
% Given parameters
P = 1e-3; % Power of the laser in watts
w_0 = 0.5e-3; % Beam waist in meters

% Calculate the peak intensity at the waist
I_peak = 2 * P / (pi * w_0^2);

% Display the result in W/m^2
disp(I_peak);
%%

syms f;

% ABCD matrix for 1f distance
A_distance = [1, 1;
              0, 1];

% ABCD matrix for thin lens
A_lens = [1, 0;
          -1/f, 1];

% ABCD matrix for 1f:1f system
ABCD = A_distance * A_lens * A_distance;

% Display the result
disp(ABCD);


syms q_prime f z_0;

% ABCD matrix for 1f:1f system
ABCD = [1, 1;
        0, 1/f];

q = z_0 * (1 + j);
% Calculate q' at the back focal plane
q_prime = (ABCD(1, 1) * q + ABCD(1, 2)) / (ABCD(2, 1) * q + ABCD(2, 2));

% Display the result
disp(q_prime);

%%
syms f z0;
j = i;
q = f + (j*z0);
a = (-q/f) + 1;
qNew = q/a;
qNew = simplify(qNew);
%%
% Symbolic variables
syms f z0;

% ABCD matrix for the 1f:1f system
ABCD_1f = [1, f; 0, 1];
ABCD_lens = [1, 0; -1/f, 1];
ABCD_1f_prime = [1, f; 0, 1];

% Calculate the overall ABCD matrix
ABCD_system = ABCD_1f_prime * ABCD_lens * ABCD_1f;

% Display the resulting ABCD matrix
disp('The ABCD matrix for the 1f:1f system is:');
disp(ABCD_system);

% q parameter at the front focal plane
q = f + 1i * z0;

% Define A, B, C, D using the elements of the ABCD_system matrix
A = ABCD_system(1, 1);
B = ABCD_system(1, 2);
C = ABCD_system(2, 1);
D = ABCD_system(2, 2);

% q' parameter at the back focal plane using the evolution equation
q_prime = (A * q + B) / (C * q + D);

% Display the result
disp(['The q'' parameter at the back focal plane is:']);
disp(q_prime);

% Calculate the Rayleigh range of the new Gaussian
z_R_new = (z0^2 + f^2) / z0;

% Display the result
disp(['The Rayleigh range of the new Gaussian is:']);
disp(z_R_new);
%% Module 2 Week 1 End Assignment
% A Gaussian beam from a frequency-doubled Nd:YAG laser, 
% with wavelength 532 nm, is measured to have a beam radius of 1.6 mm and 3.0 mm 
% at two points separated by a distance of 1.0 m.

% What is the location of the beam waist relative to the 1.6 mm measurement point? 
% Express your answer as a positive distance in units of meters with two significant figures.


% Given parameters
w1 = 1.6e-3; % Beam radius at the first measurement point in meters
w2 = 3.0e-3; % Beam radius at the second measurement point in meters
lambda = 532e-9; % Wavelength in meters
d = 1.0; % Distance between the measurement points in meters
syms z1 zR;
z2 = z1 + d;
a =w1*w1/w2*w2;
eqn = z1^2 + zR^2 == a*(z2^2 + zR^2);
z1_sol = solve(eqn, z1);

% Calculate the beam waist radius using the two measurement points
w0 = sqrt((w2^2 - w1^2) * (d * lambda) / (w1^2 + w2^2));

% Calculate the location of the beam waist relative to the first measurement point
z = (pi * w1^2 * w0^2) / (lambda * (w2^2 - w1^2));

% Display the result
fprintf('The location of the beam waist relative to the first measurement point is %.2f meters.\n', z);
