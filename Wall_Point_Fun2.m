function Wall_Out=Wall_Point_Fun(plus_in,Pressure,Temperature,R,k,w)
%Notes
%Point 1 indicates the interior point with + Characteristic line
%Point 0 indicates the intersection at the wall
%L is lambda
%D1 D2 D3 are the constants for the wall quadratic eqn
%w is Omega
%T is the stagnation temperature
%k is specific heats ratio
%R is the gas constant

x1=plus_in(1);
y1=plus_in(2);
ui=plus_in(3);
vi=plus_in(4);

T=Temperature;
P=Pressure;
atot=sqrt(k*R*T);
D1=0.019171267034391;
D2=0.142169804334580;
D3=-0.071092506542929;
i=1;
Tolerance=10^-4;
error=1;
ue(1)=1;
ve(1)=1;
xe(1)=1;
ye(1)=1;

while error>Tolerance
i=i+1;
if i==2;
u1=ui;
v1=vi;
V1=sqrt(u1^2+v1^2);
a1=sqrt(atot^2-(k-1)*(V1^2)/2);
M1=V1/a1;
alpha1=asin(1/M1);
theta1=atan(v1/u1);
L1=tan(theta1+alpha1);
A=u1^2-a1^2;
B=2*u1*v1-(u1^2-a1^2)*L1;
C=w*(a1^2)*v1/y1;

a=D3; b=(D2-L1); c=D1+L1*x1-y1;
else
u1=0.5*(ui+u0);
v1=0.5*(vi+v0);
V1=sqrt(u1^2+v1^2);
a1=sqrt(atot^2-(k-1)*(V1^2)/2);
M1=V1/a1;
alpha1=asin(1/M1);
theta1=atan(v1/u1);
L1=tan(theta1+alpha1);
A=u1^2-a1^2;
B=2*u1*v1-(u1^2-a1^2)*L1;
C=w*(a1^2)*v1/(0.5*(y1+y0));

a=D3; b=(D2-L1); c=D1+L1*x1-y1;
end
x01=(-b-sqrt(b^2-4*a*c))/(2*a);
x02=(-b+sqrt(b^2-4*a*c))/(2*a);
x0=max(x01,x02);

y0=L1*(x0-x1)+y1;
F=C*x0+A*u1+B*v1-C*x1;
u0=F/(A+B*(D2+2*D3*x0));
v0=u0*(D2+2*D3*x0);
ue(i)=u0;
ve(i)=v0;
xe(i)=x0;
ye(i)=y0;
error1=abs(ue(i)-ue(i-1))/ue(i-1);
error2=abs(ve(i)-ve(i-1))/ve(i-1);
error3=abs(xe(i)-xe(i-1))/xe(i-1);
error4=abs(ye(i)-ye(i-1))/ye(i-1);
error=[error1,error2,error3,error4]
error=max(error);
end

Wall_Out=[x0,y0,u0,v0,i];
end