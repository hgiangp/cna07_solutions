%% Figure 2 BER vs APD gain varying SI 

params 

APD_gain = 1:3:40;  

P_t_dBm = 0;     % dBm
P_t = dbm2w(P_t_dBm); 

  
a = a_func(L, d, phi, beta_v)
% a = 1.8 * 1e-3; 

P_s = a * P_t; 

T = 300; 

%----------------------------
R_b = 2*1e9; 


C_n_2 = [6*1e-15, 2*1e-14];

%------------------

ber_ana = zeros(length(C_n_2), length(APD_gain)); 
ber_sim = zeros(length(C_n_2), length(APD_gain)); 


for isi = 1:length(C_n_2)
    c_n_2 = C_n_2(isi); 
    for idx = 1:length(APD_gain)
        ber_ana(isi, idx) = analysis2(c_n_2, APD_gain(idx), P_s, T, R_b); 
        ber_sim(isi, idx) = simulation2(c_n_2, APD_gain(idx), P_s, T, R_b); 
    end
end 


ana = {'-', '-'}; 
sim = {'o', '+'}; 

for isi = 1:length(C_n_2)
    semilogy(APD_gain, ber_ana(isi, :),  string(ana(isi)));
    hold on
    semilogy(APD_gain, ber_sim(isi, :), string(sim(isi))); 
end 
grid on
ylim([1e-10 1])
legend('$C^2_n = 6 \times 10^{-15}$ analysis', '$C^2_n = 6 \times 10^{-15}$ simulation', '$C^2_n = 2 \times 10^{-14}$ analysis', '$C^2_n = 2 \times 10^{-14}$ simulation','Interpreter', 'Latex')


% legend('SI = 0.1', 'SI = 0.3', 'SI = 0.5')



