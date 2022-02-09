%% Figure 2 BER vs APD gain varying SI 

params 

APD_gain = 15; 


P_t_dBm = -4; % dBm
P_t = dbm2w(P_t_dBm); 
a = a_func(L, d, phi, beta_v); 
P_s = a * P_t;  

C_n_2 = 0.1:0.4:4; 
C_n_2 = C_n_2 * 1e-14;  
  
R_b = [0.1 0.2 0.5 1 2]*1e9; 

T = 300; 

%------------------
SI_func = @(sigma_s_2) exp(sigma_s_2) - 1; 

%----------------------------

ber_ana = zeros(length(C_n_2), length(P_t_dBm)); 
ber_sim = zeros(length(C_n_2), length(P_t_dBm)); 



for isi = 1:length(C_n_2)
    si = SI_func(sigma_x_2_func(lambda, C_n_2(isi), L)); 
    for idx = 1:length(R_b)
        ber_ana(isi, idx) = analysis(si, APD_gain, P_t, T, R_b(idx)); 
        ber_sim(isi, idx) = simulation(si, APD_gain, P_t, T, R_b(idx)); 
    end
end 

ana = {'-', '-', '-', '-', '-'}; 
sim = {'o', '+', 'v', 's', '^'};  

for isi = 1:length(R_b)
    semilogy(P_t_dBm, ber_ana(isi, :), string(ana(isi)));
    hold on 
    semilogy(P_t_dBm, ber_sim(isi, :), string(sim(isi))); 
end 
grid on 
ylim([1e-6 1])

legend('$C^2_n = 6 \times 10^{-15}$ analysis', '$C^2_n = 6 \times 10^{-15}$ simulation', '$C^2_n = 2 \times 10^{-14}$ analysis', '$C^2_n = 2 \times 10^{-14}$ simulation','Interpreter', 'Latex')



