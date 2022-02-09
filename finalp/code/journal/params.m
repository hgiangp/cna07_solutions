beta_v = 0.1/1e3; 
phi = 1e-3; % rad 
% d = 0.02; 
d = 0.044601655266774; 

a_func = @(L, D, phi, beta_v) (pi * (D/2)^2)/(pi *(phi * L/2)^2) * exp(-beta_v * L); 

