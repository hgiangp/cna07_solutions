function [ber] = analysis(SI, APD_gain, P_s_dBm, T)
% clear 

% load system parameters and constants 
utils 

P_s = dbm2w(P_s_dBm);

% Ber calculation 
N = 20; 


sigma_s = sqrt(sigma_s_2(SI)); 

[zeros_hermite, weights_hermite] = GaussHermite(N);  

y_tmp = exp(sqrt(2) * sigma_s * zeros_hermite - sigma_s_2(SI)/2);  

sigma_N_i_2 = 2 * q * APD_gain^2 * F_A(APD_gain) * Re * Delta_f * m/4 * P_s * y_tmp ...
    + (4 * k_B * T/ R_L)* F_n * Delta_f; 


ber = 1/sqrt(pi) * sum(weights_hermite .* qfunc((m * Re * APD_gain * P_s * y_tmp)./(4*sqrt(sigma_N_i_2))))

end