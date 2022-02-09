%% Figure 2 BER vs APD gain varying SI 

params 

APD_gain = 15;  

% P_t_dBm = 0;     % dBm
% P_t = dbm2w(P_t_dBm); 
%   
% a = a_func(L, d, phi, beta_v); 
% P_s = a * P_t; 
P_s_dBm = -40:3:-10; 
P_s = dbm2w(P_s_dBm); 

T = 300; 

%----------------------------
R_b = 2*1e9; 


% C_n_2 = [6*1e-15, 2*1e-14];

%------------------
% SI_func = @(sigma_s_2) exp(sigma_s_2) - 1; 
SI = [0.1 0.3 0.5]; 

% ber_ana = zeros(length(C_n_2), length(APD_gain)); 
% ber_sim = zeros(length(C_n_2), length(APD_gain)); 

ber_ana = zeros(length(SI), length(P_s)); 
ber_sim = zeros(length(SI), length(P_s)); 


% for isi = 1:length(C_n_2)
for isi = 1:length(SI)
%     si = SI_func(sigma_x_2_func(lambda, C_n_2(isi), L));
    si = SI(isi); 
    for idx = 1:length(P_s)
        ber_ana(isi, idx) = analysis(si, APD_gain, P_s(idx), T, R_b); 
%         ber_sim(isi, idx) = simulation(si, APD_gain(idx), P_s_dBm, T); 
    end
end 

makerr = {'-o', '-x', '-s'}; 

% for isi = 1:length(C_n_2)
for isi = 1:length(SI)
    ma = string(makerr(isi))
    semilogy(P_s_dBm, ber_ana(isi, :), ma);
    hold on
%     semilogy(APD_gain, ber_sim(isi, :), ma); 
end 
grid on
ylim([1e-10 1])


% legend('SI = 0.1', 'SI = 0.3', 'SI = 0.5')



