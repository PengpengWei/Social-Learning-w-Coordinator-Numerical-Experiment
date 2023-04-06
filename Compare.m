delta = 0.9;
p = 0.005 : 0.005 : 0.495;
sim_num = length(p);
bhw_sw = zeros(sim_num,1);
nsii_sw = zeros(sim_num,1);
nsii_rev = zeros(sim_num,1);



for i = 1 : sim_num
    bhw_sw(i) = SWbhw(p(i),delta) * (1 - delta);
    nsii_sw(i) = SWnsii(p(i),delta) * (1 - delta);
    nsii_rev(i) = REVnsii(p(i),delta) * (1 - delta);
end

nsii_net_sw = nsii_sw - nsii_rev;

%%
save('results.mat','bhw_sw','nsii_sw','nsii_rev','nsii_net_sw','p','delta')

%%
figure(1)
yyaxis left
plot(p,bhw_sw,p,nsii_sw,'--',p,nsii_net_sw,'-.');
ylabel('Social Welfare \times (1-\delta)');
yyaxis right
plot(p,100*(nsii_sw-bhw_sw)./bhw_sw,'--',p,100*(nsii_net_sw-bhw_sw)./bhw_sw,'-.')
ylabel('Percentage w.r.t. the BHW SW');
ytickformat('percentage')
% ytickformat('percentage')
% legend('BHW: SW','NSII: SW','NSII: net SW','% of Coord. Profit');
legend('BHW: SW','NSII: gross SW','NSII: net SW', 'NSII improvement %','NSII net improvement %');
%ylabel('Percentage in the Gross SW Improvement');
xlabel('Crossover Prob. p');
%title('Social Welfare Comparison')
grid on
set(gca,'Fontsize',12)
%
figure(2)
yyaxis left
plot(p,nsii_rev)
ylabel('Profit  \times (1-\delta)')
set(gca,'YTick',0:max(nsii_rev)/10:max(nsii_rev));
yyaxis right
plot(p,100*nsii_rev./bhw_sw)
ytickformat('percentage')
ylabel('Percentage w.r.t. the BHW SW');
xlabel('Crossover Prob. p'); 
legend('Coord. Profit','Coord. Profit %')
%title('Utility Improvement')
grid on
set(gca,'Fontsize',12)
