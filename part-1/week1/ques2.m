% A beam of light is incident upon an equilateral prism with index of refraction of 1.5, pictured below.
% At what angle does the beam of light exit the prism, measured with respect to the normal to the exiting surface of the prism? 
% Enter your answer in degrees. 
% As an additional exercise, also trace some of the reflected beams as they travel through the prism. 
n= 1.55;
theta_i = 30;

% sind(theta_i) = sind(theta_p_in)*n;
theta_p_in = asind(sind(theta_i)/n);
intersection_two_normal = 120; %%Use GeoGebra
theta_p_out = 180 - (theta_p_in + intersection_two_normal);

% sind(theta_r) = sind(theta_p_out)*n;
theta_r = asind(sind(theta_p_out)*n);

n2 = 1.0
n1 = 1.5;
critical_angle = asind(n2/n1); %where n2 < n1;


