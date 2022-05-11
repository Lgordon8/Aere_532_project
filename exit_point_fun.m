function [exit_point] = exit_point_fun(plus_in, minus_in, Pressure, Temperature, R, gamma, omega, Patm)
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
V4=sqrt(( ((2*gamma*R*T)/(gamma-1)) * (1-(P/Pt)^((gamma-1)/gamma)) ));%Velocity from Isentropic flow relation at point 4
V2=sqrt(u2^2 + v2^2);%Velocity at point 2
a2=sqrt(atot^2 - ((gamma-1)*V2^2)/2);%Speed of sound at point 2
M2=V2/a2;
alpha2=asin(1/M2);
theta2=atan(v2/u2);

%Negative Characteristic Line
%V_min=sqrt(((2*gamma*R*T)/(gamma-1)*(1-(P/Pt)^((gamma-1)/gamma))));
% V3=sqrt(u3^2+v3^2);
% a3=sqrt(atot-((gamma-1)*V3^2)/2);
% M3=V3/a3;
% alpha3=asind(1/M3);
% theta3=atand(v3/u3);
% L0=tan(theta3-alpha3);
L0=v3/u3;

%Positive compatibility equations
L_pos=tan(theta2+alpha2);
A_pos=u2^2-a2^2;
B_pos=2*u2*v2-A_pos*L_pos;
C_pos=(omega*(a2^2*V2))/y2;

%x and y along the streamline

x4=(L_pos*x2 - L0*x3 + y3 - y2)/(L_pos-L0); %modiefied
%y4=L_pos*(x4-x2)+y2; %modiefied

% x4=(y3-L0*x3-y2+L_pos*x2)/L_pos; %Zuckrow derivation
y4=y2 - L_pos*x2 + L_pos*x4; %Zucrow derivation

T_pos=C_pos*(x4-x2) + A_pos*u2 + B_pos*v2;

%Streamwise and transverse velocities
u4=((A_pos*T_pos)-(B_pos*V4^2*(A_pos^2+B_pos^2)-T_pos^2)^(1/2))/(A_pos^2+B_pos^2);
v4=sqrt((V4^2-u4^2));

exit_point=[x4 y4 u4 v4];

% y0=y4;
% x0=x4;
% u0=u4;
% v0=v4;

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
