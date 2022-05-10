function[x0,y0,u0,v0] = Symmetry_Point_Fun(minus_in,Pressure,Temperature,R,gamma,omega)



x_min=minus_in(1);
y_min=minus_in(2);
u_min=minus_in(3);
v_min=minus_in(4);

%stagnation sos
a_stag = sqrt(gamma*R*Temperature);

%local sos
V_min = sqrt(u_min.^2 + v_min.^2);
a_min = sqrt(a_stag.^2 - (gamma-1)*( (V_min.^2)/2 )); 

%local Mach
Mach_min = V_min/a_min;

%Mach angle
alpha_min = asin(1/Mach_min);

%flow angle
theta_min = atan(v_min./u_min);

%slope of the characteristic
lambda_min = tan(theta_min - alpha_min);




%compatability equations
A_min = u_min.^2 - a_min.^2;
B_min = 2.*u_min.*v_min - (u_min.^2 - a_min.^2).*lambda_min;
C_min = omega.*a_min.^2.*(v_min./y_min);
D_min = A_min.*u_min + B_min.*v_min - C_min.*x_min;

%{
F=[0 1 0 0 ; -lambda_min 1 0 0 ; 0 0 0 0; -C_min 0 A_min B_min ];
G=[0; y_min-lambda_min*x_min ; 0 ; D_min];
F_in=inv(F);
x_y_u_v=F_in*G;

x=x_y_u_v(1);
y=x_y_u_v(2);
u= x_y_u_v(3);
v= x_y_u_v(4);
%}

x0 = -(y_min + lambda_min.*x_min)./lambda_min;
y0 = 0;
v0 = 0;
u0 = (C_min.*(x0-x_min) - B_min.*(v_min))./A_min + u_min;


end

