function [x0,y0,u0,v0] = exit_point_fun(plus_in, minus_in, Pressure, Temperature, R, gamma, omega, Patm)
%This function calculates the compatibility equations of the Exit
%   X_pos and x_in are the inputs form the characteristic lines with a
%   posistive and negative slope respectifully

x_pos=plus_in(1);
y_pos=plus_in(2);
u_pos=plus_in(3);
v_pos=plus_in(4);

x_min=minus_in(1);
y_min=minus_in(2);
u_min=minus_in(3);
v_min=minus_in(4);

%Setting the Temperatur and pressure and Total Speed of Sound
T=Temperature;
P=Pressure;
atot=sqrt(gamma*R*T);

%Positive characteritics line
%V_pos=sqrt(((2*gamma*R*T)/(gamma-1)*(1-(P/Pt)^((gamma-1)/gamma))));
V_pos=sqrt(u_pos^2+v_pos^2);
a_pos=sqrt(atot^2-(gamma-1)*V_pos^2/2);
M_pos=V_pos/a1;
alpha_pos=asin(1/M_pos);
theta_pos=atan(v_pos/u_pos);

%Negative Characteristic Line
%V_min=sqrt(((2*gamma*R*T)/(gamma-1)*(1-(P/Pt)^((gamma-1)/gamma))));
V_min=sqrt(u_min^2+v_min^2);
a_min=sqrt(atot^2-(gamma-1)*V_min^2/2);
M_min=V_min/a_min;
alpha_min=asind(1/M_min);
theta_min=atand(v_min/u_min);

%Positive compatibility equations
L_pos=tand(theta_pos+alpha_pos);
Q_pos=u2^2-a2^2;
R_pos=2*u2*v2-Q_pos*L_pos;
S_pos=(a2^2*V2)/y3;
T_pos=S_pos*(x4-x2)+Q_pos*u2+R_pos*v2;
u4=((Q_pos*T_pos)-(R_pos*V4^2*(Q_pos^2+R_pos^2)-T_pos^2)^(1/2))/(Q_pos^2+R_pos^2);
v4=(V4^2-u^2)^(1/2);
y4=y2-L_pos*x2+L_pos*x4;
x4=((y3-y4)/L_0)-x3;
y0=y4;
x0=x4;
u0=u4;
v0=v4;


% A_pos=u_pos^2-a_pos^2;
% B_pos=2*u_pos*v_pos-(u_pos^2-a_pos^1)*L_pos;
% C_pos=omega*a_pos^2*v_pos/y_pos;
% D1_pos=1;
% D2_pos=-1;
% D3_pos=0.25;
% a=D3_pos;
% b=(D2_pos-L_pos);
% c=D1_pos+L_pos*x_pos-y_pos;
% x0=(-b+sqrt(b^2-4*a*c))/(2*a);
% 
% y0=L_pos*(x0-x_pos)+y_pos;
% F=C_pos*x0+A_pos*u_pos+B_pos*v_pos-C_pos*x_pos;
% u0=F/(A_pos+B_pos*(D2_pos+2*D3_pos*x0));
% v0=u0*(D2_pos+2*D3_pos*x0);

end