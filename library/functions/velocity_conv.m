function [velocity, speed_rad_per_s]  = velocity_conv(v, x9) 
velocity = v * 5/18;
speed_rad_per_s  = (v*5/18)/x9;
end
