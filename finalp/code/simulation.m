function [ber] = simulation(SI, APD_gain, P_s_dBm, T)

utils; 

mu_X = -sigma_s_2(SI)/2; 
sigma_X = sqrt(sigma_s_2(SI));

P_s = dbm2w(P_s_dBm);  

no_slots = 1e7 ; 
% f_c = 80; 

time = linspace(0, 5, no_slots); 
% p0_t_out = zeros(1, length(time));

% a_i_arr = zeros(1, length(time)); 

r_t = zeros(1, length(time)); 


num_errors = 0; 

for idx = 1:length(time)
    
%     t = time(idx); 
    
    a_i = (rand() > 0.5); 
%     a_i_arr = [a_i_arr a_i]; 

%     p0_t_out(idx) = P_t(P_s, f_c, a_i, t);

    x_t = lognrnd(mu_X, sigma_X);

    shot_noise = normrnd(mu_shot, sqrt(sigma_sh_2(APD_gain, P_s, x_t))); 
    thermal_noise = normrnd(mu_thermal, sqrt(sigma_th_2(T))); 
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

% plot(time, r_t); 

num_errors

ber = num_errors/length(time)
% hold on 
% plot(time, p_t_out); 

