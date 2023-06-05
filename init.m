clear all
% motor parameters
P = 6; % number of poles
lambda_m = 0.1062;  %flux constant V-s/rad
rs = 0.01;  % stator resistance in ohms
Ld = 0.3e-3; %d-axis inductance in H
Lq = 0.3e-3; %q-axis inductance in H

% Filter parameters
L = 5e-6; % inductance in H
R = 0.01; % resistance in ohms
C = 1e-3; % capacitance in F

V_batt = 350;  % battery voltage

% define electrical rotor speed
omega_r = 3000*2*pi/60 * P/2; % rad/s


% set q-axis current
I_qs_star = 0;  %replace

%set d-axis current to zero
I_ds_star = 0;


% Current Control gains
Kq = 0.5;
Kd = 0.5;



