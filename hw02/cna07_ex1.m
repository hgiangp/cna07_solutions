EbN0_dB = -1:0.1:15;

EbN0 = 10.^(EbN0_dB/10);
BER_uni = 1/2.*erfc(sqrt(EbN0)/sqrt(2));
BER_pi = 1/2.*erfc(sqrt(EbN0*2)/sqrt(2));

tmp = zeros(size(EbN0, 1)); 

% OOK 

semilogy(EbN0_dB,BER_uni)
hold on 

EbN0_dB_sim = -1:15; 
EbN0_sim = 10.^(EbN0_dB_sim/10); 
smld_err_prb = zeros(size(EbN0_sim, 2), 1); 

for i = 1:length(EbN0_sim)
    SNR = 2* EbN0_sim(i); 
    smld_err_prb(i) = smldPe54(SNR, 1);
end 

semilogy(EbN0_dB_sim, smld_err_prb, 'o');

% NRZ - L
semilogy(EbN0_dB, BER_pi)

for i = 1:length(EbN0_sim)
    SNR = 8* EbN0_sim(i); 
    smld_err_prb(i) = smldPe54(SNR, 2);
end 

semilogy(EbN0_dB_sim, smld_err_prb, '*');


grid on
ylim([10^(-7), 10^0])
xlim([-1 15])
xticks(-1:1:15)
ylabel('Bit error probability, $P_B$', 'Interpreter','latex')
xlabel('$E_b/N_0$ (dB)', 'Interpreter','latex')

legend('OOK Analysis', 'OOK Simulation', 'NRZ-L Analysis', 'NRZ-L Simulation')

hold off 
