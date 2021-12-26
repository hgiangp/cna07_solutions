EbN0_dB = -1:0.1:15;

EbN0 = 10.^(EbN0_dB/10);
BER_uni = 1/2.*erfc(sqrt(EbN0)/sqrt(2));
BER_pi = 1/2.*erfc(sqrt(EbN0*2)/sqrt(2));
xticks auto 
semilogy(EbN0_dB,BER_uni)
hold on 
semilogy(EbN0_dB, BER_pi)
grid on
ylim([10^(-8), 10^0])
xlim([-1 15])
xticks(-1:1:15)
ylabel('Bit error probability, $P_B$', 'Interpreter','latex')
xlabel('$E_b/N_0$ (dB)', 'Interpreter','latex')

x = [0.7 0.9];   % adjust length and location of arrow 
y = [0.7 0.5];

annotation('textarrow',x,y,'FontSize',13,'Linewidth',2)
annotation('textbox',[.6 .3 .7 .27],'EdgeColor','none','String','$Q\bigg(\sqrt\frac{2E_b}{N_0}\bigg)$','FontSize',13,'Linewidth',2, 'Interpreter','latex')
annotation('textbox',[.6 .3 .4 .2],'EdgeColor','none','String','Matched filter reception of pibolar baseband signaling','FontSize',13,'Linewidth',2)


% One arrow from left to right with text over it
x = [0.56 0.79];   % adjust length and location of arrow 
y = [0.5 0.5];
annotation('textarrow',x,y,'FontSize',13,'Linewidth',2)
annotation('textbox',[.6 .3 .9 .27],'EdgeColor','none','String','$Q\bigg(\sqrt\frac{E_b}{N_0}\bigg)$','FontSize',13,'Linewidth',2, 'Interpreter','latex')
annotation('textbox',[.6 .3 .6 .5],'EdgeColor','none','String','Matched filter reception of unipolar baseband signaling','FontSize',13,'Linewidth',2)

hold off 