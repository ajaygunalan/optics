% Given values
f = 4; % focal length (cm)
u = -2; % object distance (cm)
h_o = 3; % object height (cm)

% Calculate image distance (v) using the lens formula
v = 1/(1/f + 1/u);

% Calculate magnification (M) using the magnification formula
M = -v/u;

% Calculate image height (h_i) using the magnification
h_i = M * h_o;

% Display the results
fprintf('Image distance (v): %.2f cm\n', v);
fprintf('Magnification (M): %.2f\n', M);
fprintf('Image height (h_i): %.2f cm\n', h_i);

%%

% Given values
f = 4; % focal length (cm)
u = 2; % object distance (cm)
h_o = 3; % object height (cm)

% Calculate image distance (v) using the lens formula
v = 1/(1/f - 1/u);

% Calculate magnification (M) using the magnification formula
M = v/u;

% Calculate image height (h_i) using the magnification
h_i = M * h_o;

% Display the results
fprintf('Image distance (v): %.2f cm\n', v);
fprintf('Magnification (M): %.2f\n', M);
fprintf('Image height (h_i): %.2f cm\n', h_i);

%%
% Given values
f = 8; % Focal length of the objective lens (mm)
M = 20; % Desired magnification

% Equation to solve for u and v
syms u v;
eq1 = 1/f == 1/u + 1/v;
eq2 = v == M * u;

% Solving the equations
sol = solve([eq1, eq2], [u, v]);

% Displaying the object distance (u) in mm with 2 significant figures
u_result = double(sol.u);
fprintf('The object distance (u) to achieve a 20X magnification is: %.2f mm\n', u_result);

