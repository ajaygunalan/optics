% When a ray of light traveling in air hits a tilted plane parallel slab (of glass, say), 
% it emerges parallel to the original ray but shifted transversely.
% 
% Carefully draw out the situation and use Snell’s law to derive the amount of the transverse shift, 
% x, as a function of the tilt angle of the slab, θ, its thickness,  d,  and its index of refraction, n. 
% 
% Find the exact expression with no approximations. 
% 
% We recommend you do this out all in variables because it's a useful formula to have.
% Also, you will want this for the following questions.
% 
% However, since the auto-grader has difficulty with these formulas, use 
% n=1.5, d=1.0 cm, and  θ = 45° and enter a numerical answer. Give your answer in cm to two significant figures.

% Given values
n = 1.5;       % Refractive index of the glass slab
d = 1.0;       % Thickness of the slab in cm
theta = 45;    % Angle of tilt in degrees

% Convert theta from degrees to radians
theta = theta * pi / 180;

% Calculate the transverse shift
sin_theta = sin(theta);
x = d * (sin_theta / sqrt(n^2 - sin_theta^2) - sin_theta);

% Display the result
disp(['Transverse shift: ', num2str(x), ' cm']);
