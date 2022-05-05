%ME 532 Quiz 8 Method of Characteristics calculation
%Initialize Key variables
%Initial conditions on initial value line, units in comments
%i) Subsonic
x_1=0.1 %m
x_2=0.12 %m
t_1=0 %s
t_2=0 %s  
u_1=200 %m/s
u_2=200 %m/s
roh_1= 1.2 %kg/m^3
roh_2= 1.2 %kg/m^3
P= 101325 %Pa, from 1 atm given, held constant
gamma=1.4 %assumed for air as an ideal gas
a_1=sqrt(gamma*P/roh_1) %m/s
a_2=sqrt(gamma*P/roh_2) %m/s


%ii)  Supersonic
%Initialize Key variables
%Initial conditions on initial value line, units in comments
%x_1=0.1 %m
%x_2=0.12 %m
%t_1=0 %s
%t_2=0 %s
%u_1=400 %m/s
%u_2=400 %m/s
%roh_1= 1.2 %kg/m^3
%roh_2= 1.2 %kg/m^3
%P= 101325 %Pa, from 1 atm given, held constant
%gamma=1.4 %assumed for air as an ideal gas
%a_1=sqrt(gamma*P/roh_1) %m/s
%a_2=sqrt(gamma*P/roh_2) %m/s

%Define Characteristic Finite differencing equations
C=[1 -(u_1+a_1); 1 -(u_1-a_1)]
D=[x_1-(u_1+a_1)*t_1 ; x_2-(u_1-a_1)*t_2]
C_in=inv(C)
x_t=C_in*D
x_3=x_t(1)
t_3=x_t(2)


%Define Compatability Finite differencing equations
A=[1 roh_1/a_1; -1 roh_2/a_2]
B= [roh_1+(u_1*roh_1)/a_1 ; -roh_2+(u_2*roh_2)/a_2 ]
A_in=inv(A)
u_roh=A_in*B
roh_3=u_roh(1)
u_3=u_roh(2)




