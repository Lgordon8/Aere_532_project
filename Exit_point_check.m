%Luke Gordon
%Exit test function
%532 Final Project
clear, clc

%test values
%plus_in=[0.22979 0.10351 422.5 663.5]; % m ,m , m/s, m/s  %assumed supersonic flow, subsonic was breaking code
plus_in=[0.24226 0.10312 455.3 619.7];%Flipped from interior point order
%minus_in=[0.24226 0.10312 455.3 619.7]; % m ,m , m/s, m/s %assumed supersonic flow, subsonic was breaking code
minus_in=[0.22979 0.10351 422.5 663.5];%Flipped from interior point order
%%   Test Case Values
Pressure=5.0d6; % pa Stag pressure
Temperature= 1000; %K Stag temperature
R=287; %J/ KG K 
gamma=1.4;
omega=1; %given in project prompt for axisymmetric nozzle
Patm=0.05d6; %Ambient Pressure

[exit_point] = exit_point_fun(plus_in, minus_in, Pressure, Temperature, R, gamma, omega, Patm);
fprintf('Output Values from Exit function %g\n',exit_point)