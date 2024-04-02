clc;
% Script Info
% Input RAW data from given csv files
% Options for importing: Import Tool, readmatrix
% Prepare data for plotting torques vs wind incident angles
Angles = angle1;
Torques = [Torque_at_2ms, Torque_at_4ms, Torque_at_6ms, Torque_at_8ms, Torque_at_10ms];
% Plot Torque (y) vs Wind Incident Angle (x)
figure(1)

plot(Angles, Torque_at_2ms, ':o') % plot values for speed 2m/s
hold on
plot(Angles, Torque_at_4ms, ':o') % plot values for other wind speeds
plot(Angles, Torque_at_6ms, ':o')
plot (Angles, Torque_at_8ms, ':o')% Setup MATLAB (Clean Slate)
plot (Angles, Torque_at_10ms, ':o')
xlabel('Wind Incident Angle (deg)')
ylabel('Torque (Nm)')
title('Torque vs Wind Incident Angle')
legend('2 m/s','4 m/s', '6 m/s', '8 m/s', '10 m/s')
hold off
% Average Torque for each wind speed
Avg_Torques2 = mean(Torque_at_2ms, "all");
Avg_Torques4 = mean(Torque_at_4ms, "all");
Avg_Torques6 = mean(Torque_at_6ms, "all");
Avg_Torques8 = mean(Torque_at_8ms, "all");
Avg_Torques10 = mean(Torque_at_10ms, "all");
Avg_Torque = [Avg_Torques2; Avg_Torques4; Avg_Torques6; Avg_Torques8; Avg_Torques10;];
% Calculate Power for each Wind Speed
Power2 = (2 * 2 * Avg_Torques2) / 0.3;
Power4 = (4 * 2 * Avg_Torques4) / 0.3;
Power6 = (6 * 2 * Avg_Torques6) / 0.3;
Power8 = (8 * 2 * Avg_Torques8) / 0.3;
Power10 = (10 * 2 * Avg_Torques10) / 0.3;

Power = [Power2; Power4; Power6; Power8; Power10;];
Wind_Speed = [2; 4; 6; 8; 10;];
% lambda = tip-speed ratio = 1
% Wind_Speed = wind speed (m/s)
% Tau = torque (N*m)
% d = diameter (m) = 0.3
% Define Constants
% Plot Power (W) vs Wind Speed (m/s)
figure(2)
plot(Wind_Speed, Power, 'o')
xlabel('Wind Speed (m/s)')
ylabel('Power (W)')
title('Power vs Wind Speed')
% Export Power Calculations to spreadsheet
Data = [Wind_Speed, Power, Avg_Torque];
writematrix(Data, 'Output_Data.xlsx')
