% Given parameters
f1 = 10.0;  % focal length of the first lens in cm
f2 = 20.0;  % focal length of the second lens in cm
T_total = 80.0;   % total object to image distance in cm
M_total = -1.10;  % magnification
d = 38.245;

p1 = 1/f1;
p2 = 1/f2;

% Define symbolic variables
syms t1

% Define the equations
P = p1 + p2 - (d*p1*p2);
M = 1 /(1 + (t1*P) - (d*p2));
t2 = M*(t1-d*(1+(p1*t1)));
T = t1 + d + t2;

% Solve for t1
eqn1 = T_total == T;
eqn2 = M_total == M;

sol = vpasolve([eqn1, eqn2], t1);

% Check if solutions exist
if isempty(sol)
    disp('No solution found.')
else
    % Print the solution
    disp(['The value for t1 is: ', num2str(sol), ' cm']);
end

% Define an objective function that calculates the sum of squares of the differences
objective = @(t1) (T_total - (t1 + d + (1 /(1 + (t1*P) - (d*p2)))*(t1-d*(1+(p1*t1)))))^2 + ...
    (M_total - (1 /(1 + (t1*P) - (d*p2))))^2;

% Use fminsearch to find the t1 that minimizes the objective function
t1_estimate = fminsearch(objective, 1);  % Start the search at t1=1 cm

% Print the estimated t1
disp(['Estimated t1: ', num2str(t1_estimate), ' cm']);

