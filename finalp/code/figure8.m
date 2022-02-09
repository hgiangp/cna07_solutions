%% Figure 2 BER vs APD gain varying SI 

params 

APD_gain = 15; 


P_t_dBm = -4; % dBm
P_t = dbm2w(P_t_dBm); 
a = a_func(L, d, phi, beta_v); 
P_s = a * P_t;  

C_n_2 = 0.1:0.3:4; 
C_n_2 = C_n_2 * 1e-14;  
  
R_b = [0.1 0.2 0.5 1 2]*1e9; 

T = 300; 

%------------------
SI_func = @(sigma_s_2) exp(sigma_s_2) - 1; 

%----------------------------

ber_ana = zeros(length(C_n_2), length(P_t_dBm)); 
ber_sim = zeros(length(C_n_2), length(P_t_dBm)); 



for isi = 1:length(R_b) 
    for idx = 1:length(C_n_2)
        si = SI_func(sigma_x_2_func(lambda, C_n_2(idx), L))

        ber_ana(isi, idx) = analysis(si, APD_gain, P_s, T, R_b(isi)); 
        ber_sim(isi, idx) = simulation(si, APD_gain, P_s, T, R_b(isi)); 
    end
end 

ana = {'-', '-', '-', '-', '-'}; 
sim = {'o', '+', 'v', 's', '^'};  

for isi = 1:length(R_b)
    h1(isi) = semilogy(C_n_2, ber_ana(isi, :), string(ana(isi)));
    hold on 
    semilogy(C_n_2, ber_sim(isi, :), string(sim(isi))); 
end 
legend(h1, 'R_b = 100 Mb/s', 'R_b = 200 Mb/s', ...
    'R_b = 500 Mb/s', ...
    'R_b = 1 Gb/s', ...
    'R_b = 2 Gb/s')
grid on 
xlabel('$C^2_n$', 'Interpreter','latex')
ylabel('Bit Error Rate')
ylim([1e-6 1])





