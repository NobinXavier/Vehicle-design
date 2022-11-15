clear;
clc;
 addpath 'C:\Users\nopzz\Documents\Embedded C\matlab\library\functions'
flag = 0;
while(flag == 0)
a = input('Enter the drive cycle-1/2/3:');

if a == 1   
    drivecycle = readmatrix('data\drivecycle\drivecycle1.xlsx');   
flag = 1;
elseif a == 2
        drivecycle = readmatrix('data\drivecycle\drivecycle2.xlsx');
flag = 1;
elseif a == 3
            drivecycle = readmatrix('data\drivecycle\drivecycle3.xlsx'); 
flag = 1;
else
    fprintf('wrong entry!');
    flag = 0;
end
end
speed_kmph = drivecycle(:,2);

data = readmatrix('data\vehicle\Vehicle_data.xlsx');
flag1 = 0;
while(flag1 == 0)
b = input('Enter the type of vehilce: SUV-1, Sedan-2, Minivan-3: ');

if b == 1
    x2 = data(1,2);
    x5 = data(1,3);
    x4 = data(1,4);
    flag1 = 1;
elseif b == 2
    x2 = data(2,2);
    x5 = data(2,3);
    x4 = data(2,4);
    flag1 = 1;
elseif b == 3
    x2 = data(3,2);
    x5 = data(3,3);
    x4 = data(3,4);
    flag1 = 1;
else
    fprintf('Wrong entry!');
    flag1 = 0;
end
end

tyre = readmatrix("data\tyre\tyresize.xlsx");
tyre_width = tyre(:,1);
sidewall_height = tyre(:,2);
rim_radius = tyre(:,3);


flag2 = 0;
while (flag2 == 0)
    c = input('enter the tyre specification: 1-185/55R16, 2-185/55R17, 3-185/50R18 : ');
if c == 1
    x9 = rr(tyre_width(1),sidewall_height(1), rim_radius(1));
    flag2 = 1;
elseif c == 2
    x9 = rr(tyre_width(2),sidewall_height(2), rim_radius(2));
    flag2 = 1;
elseif c == 3
    x9 = rr(tyre_width(3),sidewall_height(3), rim_radius(3));
    flag2 = 1;
else
    fprintf("choose the value from the given options: ");
    flag2 = 0;
end
end

x1 = .5; %coeff of friction
%x2 = 1500; mass
x3 = velocity_conv(speed_kmph,x9);
%x4 = 3; frontal area
%x5 = .4; drag coeff
x6 = 1.225; %density of air
x7 = 9.81; %g
x8 = 10; %road gradient
%x9 = .25; rolling radius
rolling_resistance = rolling_resist(x1, x2, x3, x4, x5, x6, x7, x8);
display(rolling_resistance);

torque = torque(x1, x2, x3, x4, x5, x6, x7, x8, x9);
display(torque);

speed_rad_per_s = velocity_conv(x3, x9);
display(speed_rad_per_s);
speed_vs_torque = plot(speed_rad_per_s, torque, "r--");
xlabel("Speed (rad/s)");
yyaxis right;
ylabel('Torque (Nm)');
hold on
speed_vs_rolling_resistance = plot(speed_rad_per_s, rolling_resistance, 'b--');
xlabel("Speed (rad/s)");
yyaxis left;
ylabel("Rolling resistance (N)");
legend('Torque', 'Rolling Resistance', 'Location', 'Northeast');

run('C:\Users\nopzz\Documents\Embedded C\matlab\data\Motor\motor.m')




