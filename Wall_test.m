clear all;
close all;
clc;
load('Nozzle_Contour')
yyw=yyw*0.02;
xxw=xxw*0.02;
p=polyfit(xxw,yyw,2);
D3=p(1);
D2=p(2);
D1=p(3);
xp=[0:0.001:0.12];
yp=D3*xp.^2+D2*xp+D1;

Pressure=5d6;
Temperature=3000;
P=Pressure;
T=Temperature;
R=320;
k=1.4;
w=0;
num_pts=16;
rho_t=0.050d0;
y_t=0.020d0;

[x,y,u,v,M,eps]=Initial_Line_Fun(P,T,R,k,w,rho_t,y_t,num_pts);

x1=x(end-1);
y1=y(end-1);
u1=u(end-1);
v1=v(end-1);
Pressure=5d6;
Temperature=3000;

plus_in=[x1,y1,u1,v1];
Out=Wall_Point_Fun2(plus_in,Pressure,Temperature,R,k,w);
x0=Out(1);
y0=Out(2);
u0=Out(3);
v0=Out(4);
u0;
v0;

% i=0;
% for x=0:0.1:10;
% i=i+1;
% y=D1+D2*x+D3*x^2;
% xw(i)=x;
% yw(i)=y;
% end

figure(1)
plot(x,y,'-o')
hold on;
plot(xxw,yyw,'k')
hold on;
plot(xp,yp,'--k')
hold on;
plot(x0,y0,'.r')
hold on;
plot([x1,x0],[y1,y0],'-r')
axis equal;

% figure(2)
% plot(xw,yw)
% hold on;
% plot([x1,x0],[y1,y0])
% grid on; 
u_interior=u1
v_interior=v1
u_wall=u0
v_wall=v0
atot=sqrt(k*R*T);
V0=sqrt(u0^2+v0^2);
a0=sqrt(atot^2-(k-1)*(V0^2)/2);
M0=V0/a0;
theta0=atan(v0/u0);
nu0=sqrt((k+1)/(k-1))*atan(sqrt(((k-1)/(k+1))*(M0^2-1)))-atan(sqrt(M0^2-1));
k_wall=theta0-nu0

V1=sqrt(u1^2+v1^2);
a1=sqrt(atot^2-(k-1)*(V1^2)/2);
M1=V1/a1;
theta1=atan(v1/u1);
nu1=sqrt((k+1)/(k-1))*atan(sqrt(((k-1)/(k+1))*(M1^2-1)))-atan(sqrt(M1^2-1));
k_interior=theta1-nu1

