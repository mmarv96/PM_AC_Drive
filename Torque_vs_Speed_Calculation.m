N_w=1000;
N_i=1000;
I_max=250;
V_max=V_batt/sqrt(3);

w_r=linspace(0,5000,N_w); % rad/s
I_ds=-linspace(0,I_max,N_i); % Amperes
opt_Te=zeros(N_w,1);

for i=1:N_w
    Te_max=0;
    
    for j=1:N_i
        I_qs=sqrt(I_max^2 - (I_ds(j))^2);
        V_qs=rs*I_qs + w_r(i)*(Ld*I_ds(j)+lambda_m);
        V_ds=rs*I_ds(j) - w_r(i)*(Lq*I_qs);       
        V_p=sqrt(V_qs^2+V_ds^2);
        if(V_p<V_max)
            Te=1.5*(P/2)*(lambda_m*I_qs + (Ld-Lq)*I_qs*I_ds(j));
            %Pe=1.5*(V_qs*I_qs+V_ds*I_ds);%electric power
            %P_mechanical=Pe*P
            if (Te>Te_max)
                Te_max=Te;
                optimumI_ds(i)=I_ds(j);
            end
        end
    end
    
    opt_Te(i)=Te_max;
    %opt_Pm(i)=Te_max*w_r(i)*2/P;
end; 

w_rm=(w_r*2)/P;%mechanical rad/s
w_rm_rpm=w_rm*(60/(2*pi));%rpm

figure
plot(w_rm_rpm,opt_Te)
title('Torque vs Speed')

opt_Te_Trns=transpose(opt_Te);%transpose of Torque
P_m=(opt_Te_Trns.*w_rm)/1000;%mechanical power 
figure
plot(w_rm_rpm,P_m)
title('Mechanical Power vs Speed')

figure
plot(w_rm_rpm,optimumI_ds)
title('Current:Ids vs Speed')
