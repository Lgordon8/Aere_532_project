function[x,y,u,v]= Interior_Point(plus_in,minus_in,P,T,R,gamma,omega)

%x x coordinate of characteristic line intersection m
%y y coordinate of characteristic line intersection m
%u longitudinal (streamwise) velocity at characteristic line intersection m/s
%v transverse velocity at characteristic line intersection m/s

%initialize input values for x,y,u,v
x_plus=plus_in(1)
y_plus=plus_in(2)
u_plus=plus_in(3)
v_plus=plus_in(4)

x_minus=minus_in(1)
y_minus=minus_in(2)
u_minus=minus_in(3)
v_minus=minus_in(4)



%find stagnation speed of sound and local speed of sound
a_stag=sqrt(gamma*R*T) ;
V_plus=sqrt(u_plus.^2+v_plus.^2)
V_minus=sqrt(u_minus.^2+v_minus.^2)
a_plus=sqrt(a_stag.^2-(gamma-1)*(V_plus.^2)/2)    ;
a_minus=sqrt(a_stag.^2-(gamma-1)*(V_minus.^2)/2);

%find mach number for each characteristic
M_plus=V_plus/a_plus;
M_minus=V_minus/a_minus;

%find mach angle for each characteristic
alpha_plus=asind(1/M_plus);
alpha_minus=asind(1/M_minus);

%find flow angle for each characteristic
theta_plus=asind(v_plus/u_plus);
theta_minus=asind(v_minus/u_minus);

%find lambda (slope) of each characteristic
lambda_plus=tand(theta_plus+alpha_plus);
lambda_minus=tand(theta_minus-alpha_minus);

%%
%Compatiblity equation coefficients 
A_plus = u_plus.^2-a_plus.^2;
A_minus = u_minus.^2-a_minus.^2;
B_plus= 2.*u_plus.*v_plus-(u_plus.^2-a_plus.^2).*lambda_plus;
B_minus=2.*u_minus.*v_minus-(u_minus.^2-a_minus.^2).*lambda_minus;
C_plus= omega.*a_plus.^2.*v_plus./y_plus;
C_minus= omega.*a_minus.^2.*v_minus./y_minus;
D_plus  = A_plus.*u_plus+B_plus.*v_plus-C_plus.*x_plus;        %RHS of +characteristic compatability eq after rearrangement
D_minus = A_minus.*u_minus+B_minus.*v_minus-C_minus.*x_minus;  %RHS of -characteristic compatability eq after rearrangement

F=[-lambda_plus 1 0 0 ; -lambda_minus 1 0 0 ; -C_plus 0 A_plus B_plus ; -C_minus 0 A_minus B_minus ]; %matrix of coefficients for characteristic and compatibility finite difference equations
G=[y_plus-lambda_plus*x_plus; y_minus-lambda_minus*x_minus ; D_plus ; D_minus]                      ;  %column vector containing constants each of the finite difference equations are equal to
F_in=inv(F);
x_y_u_v=F_in*G;

x=x_y_u_v(1);
y=x_y_u_v(2);
u= x_y_u_v(3);
v= x_y_u_v(4);

end