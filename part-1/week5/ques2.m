% Clear workspace and command window
clear;
clc;

% Define the focal lengths of the lenses (in mm)
focal_lengths = [100, -50, 80, -280];

% Define the distances between the lenses (in mm)
distances = [20, 40, 30];

% Initialize the distance of the object from the first lens (in mm)
object_distance = 400;

% Preallocate an array to store image distances
image_distances = zeros(1, 4);

% Preallocate an array to store magnifications
magnifications = zeros(1, 4);

% Loop through each lens
for lens_number = 1:4
    % Calculate the image distance for the current lens using the lens formula
    image_distances(lens_number) = (focal_lengths(lens_number)*object_distance) / (object_distance - focal_lengths(lens_number));
    
    % Calculate the magnification for the current lens
    magnifications(lens_number) = -image_distances(lens_number) / object_distance;

    % Check if we're not at the last lens yet
    if lens_number < 4
        % The image produced by the current lens becomes the object for the next lens
        % The object distance for the next lens is the distance to the next lens minus the image distance
        object_distance = distances(lens_number) - image_distances(lens_number);
    end
end

% Calculate the total magnification
total_magnification = prod(magnifications);

% Print the total magnification
fprintf('Total magnification of the system: %.3f\n', total_magnification);