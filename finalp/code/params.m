lambda = 1.55*1e-6; 
L = 1000; 
beta_v = 0.1; 
phi = 1e-3; % rad 
d = 0.02; 


SI_func = @(sigma_s_2) exp(sigma_s_2) - 1; 
sigma_x_2_func = @(lambda, C_2_n, L) 1.23 * (2*pi/lambda)^(7/6) * C_2_n * L^(11/6);

a_func = @(L, D, phi, beta_v) (pi * d^2/4)/(pi *(phi * L/2)^2) * exp(-beta_v * L/1000); 

