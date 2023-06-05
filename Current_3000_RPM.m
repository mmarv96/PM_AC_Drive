w_rm=3000; %mechanical speed in rpm
Torque=-100; %N.m
w_rm = w_rm/9.549; %mech speed in  r in rad/s
I_r_ds = 0;

w_r=P/2*w_rm;

I_r_qs=((Torque/1.5)*2/P)/lambda_m; %1

V_r_qs=rs*I_r_qs+w_r*Ld*I_r_ds+w_r*lambda_m; %2
V_r_ds=rs*I_r_ds-w_r*Lq*I_r_qs; %3

Peak_Voltage=sqrt(3)*sqrt(V_r_qs^2+V_r_ds^2);

P_e=3/2*(V_r_qs*I_r_qs);

I_battery=P_e/V_batt;
I_r_qs_neg =((-Torque/1.5)*2/P)/lambda_m;


