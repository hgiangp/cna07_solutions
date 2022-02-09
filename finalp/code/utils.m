
q = 1.6e-19;        % C
k_B = 1.38e-23;     % W/K/Hz
m = 1;              % modulation index 
% T = 300;            % K 
R_L = 1000;         % ohm, load resistance 
F_n = 2;            % Amplifier noise figure 
% R_b = 2*1e9;            % Gbps 
k_A = 0.7;          % ionization factor
Re = 1;             % responsivity


I_threshold = 0; 


%----------------------
mu_thermal = 0; 
mu_shot = 0; 

%----------------------

Delta_f = @(R_b) R_b/2; 

%----------------------
qfunc = @(x) 1/2 * erfc(x / sqrt(2)); 

P_t_func = @(P_s, f_c, a_i, t) P_s * (1 + m * cos(2 * pi * f_c * t) + a_i * pi);

F_A_func = @(APD_gain) k_A * APD_gain + (1 - k_A)*(2 - 1/APD_gain); 

sigma_th_2_func = @(T, Delta_f) (4 * k_B * T/R_L) * F_n * Delta_f; 

sigma_sh_2_func = @(ADP_gain, P_s, x, Delta_f) 2 * q * ADP_gain^2 * F_A_func(ADP_gain) * Re * (m / 4 * P_s * x) * Delta_f; 

sigma_s_2_func  = @(SI) log(SI + 1); 

sigma_x_2_func = @(lambda, C_2_n, L) 1.23 * (2*pi/lambda)^(7/6) * C_2_n * L^(11/6); 

SI_func = @(sigma_s_2) exp(sigma_s_2) - 1; 



% sigma_s_2_2 = @(a) exp((0.49 * sigma_r^2)/(1 + 0.18 * d^2 + 0.56 * sigma_r^()))

