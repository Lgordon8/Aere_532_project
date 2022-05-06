clear all;
close all;
clc;

D1=1;
D2=-1;
D3=0.25;
x1=1;
y1=2;
u1=400;
v1=50;
Pressure=10^5;
Temperature=293;
R=287;
k=1.4;
w=1;

plus_in=[x1,y1,u1,v1];
Out=Wall_Point_Fun(plus_in,Pressure,Temperature,R,k,w);
x0=Out(1);
y0=Out(2);
u0=Out(3);
v0=Out(4);
u0
v0

i=0;
for x=0:0.1:10;
i=i+1;
y=D1+D2*x+D3*x^2;
xw(i)=x;
yw(i)=y;
end

figure(1)
plot(xw,yw)
hold on;
plot([x1,x0],[y1,y0])
grid on; 

