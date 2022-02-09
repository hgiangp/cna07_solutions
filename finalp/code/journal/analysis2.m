function [ber] = analysis(C_2_n, APD_gain, P_s, T, R_b)
% clear 

% load system parameters and constants 
utils 

% Ber calculation 
N = 20; 

delta_f = Delta_f(R_b); 


sigma_s = sqrt(sigma_x_2_func(lambda, C_2_n, L)); 

[zeros_hermite, weights_hermite] = GaussHermite(N);  

y_tmp = exp(sqrt(2) * sigma_s * zeros_hermite - sigma_x_2_func(lambda, C_2_n, L)/2);  

sigma_N_i_2 = 2 * q * APD_gain^2 * F_A_func(APD_gain) * Re * delta_f * m/4 * P_s * y_tmp ...
    + (4 * k_B * T/ R_L)* F_n * delta_f; 


ber = 1/sqrt(pi) * sum(weights_hermite .* qfunc((m * Re * APD_gain * P_s * y_tmp)./(4*sqrt(sigma_N_i_2)))) 

end