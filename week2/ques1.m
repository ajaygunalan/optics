% Design a 20 mm diameter singlet lens for visible light 
% made from Schott N-BK7 glass that operates at f number 5 (written f/5). 
% The lens should operate with an angular field of view of up to ±4 degrees 
% from the optic axis.

%%
% Design parameters
D = 20; % diameter in mm
F_number = 5;
FOV = 4; % angular field of view in degrees

% Calculate focal length
f = D * F_number;
fprintf('Focal Length: %.2f mm\n', f);

%%
% Refractive index of Schott N-BK7 glass at 587.6 nm (d-line)
n = 1.51680003;

f_inv  = 1 / f;
% Lensmaker's equation
% f_inv = (n - 1) * (1/R1 - 1/R2);
R2 = Inf; % Plano-Convex Lens

% Calculate lens radius of curvature (R1) for a plano-convex lens
R1 = 1 / ((1/f + 1/R2) * (1/(n - 1)));
fprintf('Lens Radius of Curvature (R1): %.2f mm\n', R1);
%%

% Center thickness of the lens
t = 5; % in mm, assuming a thickness of 5 mm at the center

% Check the angular field of view (FOV) requirement
z = f * tan(deg2rad(FOV/2));

% Display results


fprintf('Lens Center Thickness: %.2f mm\n', t);
fprintf('Maximum Object Distance for FOV: %.2f mm\n', z);
