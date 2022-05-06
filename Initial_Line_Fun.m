function [x,y,u,v,M,eps]=Initial_Line_Fun(P,T,R,gam,delta,rho_t,y_t,num_pts)

%distance from origin (x=0) to initial line max
eps=-(y_t/(2.d0*(3.d0+delta))*sqrt(1.2d0+1.d0)*(1.d0+delta)/(rho_t/y_t));

%speed of sound, m/s
a_star=sqrt(2.d0*gam*R*T/(gam+1.d0));

%coefficient for linear axial perturbation velocity, 1/m
alpha=sqrt((1.d0+delta)/((gam+1.d0)*rho_t*y_t));

%number of inerior points in transerve direction (not including bottom wall
%y=0
% num_pts=10;

%transverse direction domain, y
dy=y_t/num_pts;
for i=1:num_pts+1
    y(i)=(i-1)*dy;
end

%equation for v=0 line
x=-(gam+1.d0)*alpha.*(y.^2.d0)/(2.d0*(3.d0+delta));
x=x-eps;

%stremwise velocity, u, m/s
u=a_star*(1.d0+alpha.*(x+eps)+(gam+1.d0)*(alpha^2.d0).*(y.^2.d0)/(2.d0*(1.d0+delta)));
v=0.d0.*u;

a_stag=sqrt(gam*R*T);
a=sqrt(a_stag^2.d0-(gam-1.d0)*(u.^2.d0)/2.d0);
M=u./a;





