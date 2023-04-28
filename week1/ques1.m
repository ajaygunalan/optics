% Snells Law
% An thin beam of white light with negligible radius is incident at 50.0° on 10.0 cm thick slab of clear plastic.
% The index of refraction for red light in this material is 1.51 and for violet light it’s 1.54.
% Determine the approximate diameter, D, of the emerging beam.
% Express your answer in cm with two significant figures.
%
% A diagram of the problem is shown below. It is labeled with some possibly useful variables, but feel free to do the problem in any way that makes sense to you.

n_v = 1.54;
n_r = 1.51;
theta_i = 50;
t = 10;

% sind(theta_v)*n_v = sind(theta_i);
% sind(theta_r)*n_r = sind(theta_i);

theta_v = asind(sind(theta_i)/n_v);
theta_r = asind(sind(theta_i)/n_r);


v = tand(theta_v)*t;
r = tand(theta_r)*t;

% cosd(theta_i) = D/r-v;
D = cosd(theta_i)*(r-v);

