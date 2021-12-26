function [p]  = smldPe54(snr, type) 
E = 1; 
SNR = snr; 
% sgma = E/sqrt(2*SNR);
if type == 1 
    sgma = sqrt(1/SNR); 
else 
    sgma = sqrt(2/SNR); 
end 

N = 10000000;
dsrc = zeros(N, 1); 

for i = 1:N
    temp = rand; 
    dsrc(i) = (temp >= 0.5);
end 

% detection, probability of error calculation 
numoferr = 0; 

for i =1:N
    if dsrc(i) == 0
        r0 = E + normrnd(0, sgma); 
        r1 = normrnd(0, sgma); 
    else
        r0 = normrnd(0, sgma); 
        r1 = E + normrnd(0, sgma);
    end 
    
    if r0 > r1 
        decis = 0; 
    else 
        decis = 1; 
    end 
    if decis ~= dsrc(i)
        numoferr = numoferr + 1; 
    end
end

p = numoferr/N; 

end 