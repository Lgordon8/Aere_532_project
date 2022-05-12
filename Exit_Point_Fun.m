function [exit_point] = Exit_Point_Fun(plus_in, minus_in, Pressure, Temperature, R, gamma, omega, Patm)
%This function calculates the compatibility equations of the Exit
%   X_pos and x_in are the inputs form the characteristic lines with a
%   posistive and negative slope respectifully

x2=plus_in(1);%Positive input
y2=plus_in(2);
u2=plus_in(3);
v2=plus_in(4);

x3=minus_in(1);%Negative input
y3=minus_in(2);
u3=minus_in(3);
v3=minus_in(4);

%Setting the Temperature and Pressure and Total Speed of Sound
T=Temperature;
P=Pressure;
Pt=Patm;
atot=sqrt(gamma*R*T);

%Positive characteritics line
V4=sqrt(( ((2*gamma*R*T)/(gamma-1)) * (1 - ((Pt/P)^((gamma-1)/gamma)) ) ));%Velocity from Isentropic flow relation at point 4
V2=sqrt(u2^2 + v2^2);%Velocity at point 2
a2=sqrt(atot^2 - ((gamma-1)*V2^2)/2);%Speed of sound at point 2
M2=V2/a2;
alpha2=asin(1/M2);
theta2=atan(v2/u2);

%Negative Characteristic Line
L0=v3/u3;

%Positive compatibility equations
L_pos=tan(theta2+alpha2);
A_pos=u2^2 - a2^2;
B_pos=2*u2*v2 - A_pos*L_pos;
C_pos=(omega*(a2^2)*v2)/y2;

%x and y along the streamline

x4=(L_pos*x2 - L0*x3 + y3 - y2)/(L_pos-L0); %modiefied
y4=y2 - L_pos*x2 + L_pos*x4; %Zucrow derivation

%Final compatibility component
D= A_pos*u2+B_pos*v2+C_pos*(x4-x2);

%Solving for u0 and v0
u4=((A_pos*D)-(B_pos*sqrt((((A_pos^2)+(B_pos^2))*V4^2)-D^2)))/((A_pos^2)+(B_pos^2));
v4=((V4^2)-(u4^2))^(1/2);

exit_point=[x4 y4 u4 v4];
end