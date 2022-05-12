% Test Function

%WARD Test Case:
plus_in=[2.305789040088670e-04,0.018550430043148,1.125046577143496e+03,1.879466362308684];
minus_in=[4.667731058659860e-04,0.017751178327034,1.117438195509118e+03,1.726243525338538];
P =5.0d6; % pa Stag pressure
T= 1000; %K Stag temperature
R=287; %J/ KG K 
gamma=1.4;
omega=1; 
%initialize function inputs (will replace with run of IVL code)
% plus_in=[0.1,0.1,1500,0]; % m ,m , m/s, m/s  %assumed supersonic flow, subsonic was breaking code
% minus_in=[0.1,0.12,1500,0]; % m ,m , m/s, m/s %assumed supersonic flow, subsonic was breaking code
% P =5.0d6; % pa Stag pressure
% T= 3000; %K Stag temperature
% R=287; %J/ KG K 
% gamma=1.4;
% omega=1; %given in project prompt for axisymmetric nozzle

% %  Zucrow Test Case Values
% plus_in=[0.275,0.4,3030,430]; % m ,m , m/s, m/s  %assumed supersonic flow, subsonic was breaking code
% minus_in=[0.25,0.5,3000,525]; % m ,m , m/s, m/s %assumed supersonic flow, subsonic was breaking code
% %%  Zucrow Test Case Values
% P =7.0d6; % pa Stag pressure
% T= 3330; %K Stag temperature
% R=320; %J/ KG K 
% gamma=1.2;
% omega=1; %given in project prompt for axisymmetric nozzle


[check]=Interior_Point_Fun(plus_in,minus_in,P,T,R,gamma,omega)

check2=[1.434879402672728e-03 1.811338917685366e-02 1.121305610189988e+03 1.212584805014567e+01]
% x_plus=plus_in(1)
% y_plus=plus_in(2)
% u_plus=plus_in(3)
% v_plus=plus_in(4)
% 
% x_minus=minus_in(1)
% y_minus=minus_in(2)
% u_minus=minus_in(3)
% v_minus=minus_in(4)
% 
% %initialize output variables
% %x=0 %x coordinate of characteristic line intersection m
% %y=0 %y coordinate of characteristic line intersection m
% %u=0 %longitudinal (streamwise) velocity at characteristic line intersection m/s
% %v=0 %transverse velocity at characteristic line intersection m/s
% 
% %set stagnation speed of sound
% V_plus=sqrt(u_plus.^2+v_plus.^2)
% V_minus=sqrt(u_minus.^2+v_minus.^2)
% 
% a_stag=sqrt(gamma*R*T) ;
% a_plus=sqrt(a_stag.^2-(gamma-1)*(V_plus.^2)/2)    ;
% a_minus=sqrt(a_stag.^2-(gamma-1)*(V_minus.^2)/2);
% 
% %set mach for each characteristic
% M_plus=V_plus/a_plus;
% M_minus=V_minus/a_minus;
% 
% %set mach angle for each characteristic
% alpha_plus=asind(1/M_plus);
% alpha_minus=asind(1/M_minus);
% 
% %set flow angle for each characteristic
% theta_plus=asind(v_plus/u_plus);
% theta_minus=asind(v_minus/u_minus);
% 
% %define lambda (slope) of each characteristic
% lambda_plus=tand(theta_plus+alpha_plus);
% lambda_minus=tand(theta_minus-alpha_minus);
% 
% %%
% %Add compatiblity considerations
% A_plus = u_plus.^2-a_plus.^2
% A_minus = u_minus.^2-a_minus.^2
% B_plus= 2.*u_plus.*v_plus-(u_plus.^2-a_plus.^2).*lambda_plus
% B_minus=2.*u_minus.*v_minus-(u_minus.^2-a_minus.^2).*lambda_minus
% C_plus= omega.*a_plus.^2.*v_plus./y_plus
% C_minus= omega.*a_minus.^2.*v_minus./y_minus
% D_plus  = A_plus.*u_plus+B_plus.*v_plus-C_plus.*x_plus        %RHS of +characteristic compatability eq after rearrangement
% D_minus = A_minus.*u_minus+B_minus.*v_minus-C_minus.*x_minus  %RHS of -characteristic compatability eq after rearrangement
% 
% F=[-lambda_plus 1 0 0 ; -lambda_minus 1 0 0 ; -C_plus 0 A_plus B_plus ; -C_minus 0 A_minus B_minus ] %matrix of coefficients for characteristic and compatibility finite difference equations
% G=[y_plus-lambda_plus*x_plus; y_minus-lambda_minus*x_minus ; D_plus ; D_minus] %column vector containing constants each of the finite difference equations are equal to
% F_in=inv(F)
% x_y_u_v=F_in*G
% 
% x=x_y_u_v(1)
% y=x_y_u_v(2)
% u= x_y_u_v(3)
% v= x_y_u_v(4)
% 
% %