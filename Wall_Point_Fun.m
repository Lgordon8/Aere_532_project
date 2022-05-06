function Wall_Out=Wall_Point_Fun(plus_in,Pressure,Temperature,R,k,w)
%Notes
%Point 1 indicates the interior point with + Characteristic line
%Point 0 indicates the intersection at the wall
%L is lambda
%D1 D2 D3 are the constants for the wall quadratic eqn
%w is Omega
%Tt is the stagnation temperature
%k is specific heats ratio
%R is the gas constant

x1=plus_in(1);
y1=plus_in(2);
u1=plus_in(3);
v1=plus_in(4);

Tt=300;
atot=sqrt(k*R*Tt);
V1=sqrt(u1^2+v1^2);
a1=sqrt(atot^2-(k-1)*V1^2/2);
M1=V1/a1;
alpha1=asin(1/M1);
theta1=atan(v1/u1);
L1=tan(theta1+alpha1);
A=u1^2-a1^2;
B=2*u1*v1-(u1^2-a1^1)*L1;
C=w*a1^2*v1/y1;
D1=1;
D2=-1;
D3=0.25;

a=D3; b=(D2-L1); c=D1+L1*x1-y1;
x0=(-b+sqrt(b^2-4*a*c))/(2*a);

y0=L1*(x0-x1)+y1;
F=C*x0+A*u1+B*v1-C*x1;
u0=F/(A+B*(D2+2*D3*x0));
v0=u0*(D2+2*D3*x0);

Wall_Out=[x0,y0,u0,v0];
end