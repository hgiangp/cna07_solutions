function [ber] = simulation(C_2_n, APD_gain, P_s, T, R_b)

utils; 

mu_X = -sigma_x_2_func(lambda, C_2_n, L)/2; 
sigma_X = sqrt(sigma_x_2_func(lambda, C_2_n, L));

% P_s = dbm2w(P_s_dBm);  

no_slots = 1e7;  

time = linspace(0, 5, no_slots); 

r_t = zeros(1, length(time)); 


num_errors = 0; 

delta_f = Delta_f(R_b); 

for idx = 1:length(time)
   
    a_i = (rand() > 0.5); 

    x_t = lognrnd(mu_X, sigma_X);

    shot_noise = normrnd(mu_shot, sqrt(sigma_sh_2_func(APD_gain, P_s, x_t, delta_f))); 
    thermal_noise = normrnd(mu_thermal, sqrt(sigma_th_2_func(T, delta_f))); 
    i_t = 1/4 * m * Re * APD_gain * P_s * x_t; 
    
    if a_i == 1
        r_t(idx) = + i_t + shot_noise + thermal_noise; 
        if r_t(idx) < I_threshold
            num_errors = num_errors + 1; 
        end 
    else
        r_t(idx) = - i_t + shot_noise + thermal_noise;
        if r_t(idx) > I_threshold
           num_errors = num_errors + 1; 
        end 
    end 

end 


num_errors 

ber = num_errors/length(time)
