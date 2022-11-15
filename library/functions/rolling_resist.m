% Coeff_of_friction = 0.5;
% mass_of_vehicle = 1500;
% vehicle_velocity = 40;
% frontal_area = 3;
% Drag_coeff = 0.4;
% Density_of_air = 1.225;
% gravitational_acceleration = 9.81;
% road_gradient = 10;
% 
% friction_force = Coeff_of_friction * mass_of_vehicle * gravitational_acceleration;
% aerodynamic_force = 0.5 * Drag_coeff * Density_of_air * frontal_area * (vehicle_velocity)^2;
% grade_force = mass_of_vehicle * gravitational_acceleration * sin(road_gradient);
% 
% rolling_resistance = friction_force + aerodynamic_force + grade_force;

function rolling_resistance = rolling_resist (Coeff_of_friction, mass_of_vehicle, vehicle_velocity, frontal_area, Drag_coeff, Density_of_air, gravitational_acceleration, road_gradient)
rolling_resistance = (Coeff_of_friction * mass_of_vehicle * gravitational_acceleration) + (0.5 * Drag_coeff * Density_of_air * frontal_area * (vehicle_velocity).^2) + (mass_of_vehicle * gravitational_acceleration * sin(road_gradient));

end

