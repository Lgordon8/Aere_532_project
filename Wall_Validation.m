clear all;
close all;
clc;

Pressure=5d6;
Temperature=1000;
P=Pressure;
T=Temperature;
R=287;
k=1.4;
w=1;
%Validation Input Data
D1=0.038203828133254;
D2=0.272950809870707;
D3=-0.193247658324484;
x1=0.001732708744777;
y1=0.037117588899510;
u1=6.878671304593996e+02;
v1=3.226767102798708;

plus_in=[x1,y1,u1,v1];
Out=Wall_Point_Fun(plus_in,Pressure,Temperature,R,D1,D2,D3);
x0=Out(1);
y0=Out(2);
u0=Out(3);
v0=Out(4);
u0;
v0;

x_interior=x1
y_interior=y1
u_interior=u1
v_interior=v1

%Validation Output Data
x_wall=x0
y_wall=y0
u_wall=u0
v_wall=v0

