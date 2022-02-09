%% Figure 2 BER vs APD gain varying SI 

% APD_gain = 1:3:40; 
APD_gain = [15; 18]; 

P_s_dBm = -10;     % dBm

% SI = [0.1, 0.3, 0.5];
SI = [0.1, 0.3]; 
T = 300; 

%----------------------------

ber_ana = zeros(length(SI), length(APD_gain)); 
ber_sim = zeros(length(SI), length(APD_gain)); 



for isi = 1:length(SI)
    si = SI(isi); 
    for idx = 1:length(APD_gain)
        ber_ana(isi, idx) = analysis(si, APD_gain(idx), P_s_dBm, T); 
        ber_sim(isi, idx) = simulation(si, APD_gain(idx), P_s_dBm, T); 
    end
end 

makerr = {'-o', '-x', '-s'}; 

for isi = 1:length(SI)
    ma = string(makerr(isi))
    semilogy(APD_gain, ber_ana(isi, :), ma);
    hold on 
    semilogy(APD_gain, ber_sim(isi, :), ma); 
end 
grid on 


legend('SI = 0.1', 'SI = 0.3', 'SI = 0.5')



