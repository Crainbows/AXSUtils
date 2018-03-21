figure;
fig = gcf;
fig.Color = 'w';

plot1 = plot(q,data(:,1),'k',q,data(:,2),'b','LineWidth',2);
hold on
plot2 = plot(q,data(:,3),'color', [0 0.5294 0],'LineWidth',2);

plot3 = plot(q,data(:,4),'r','LineWidth',2);

ax = gca;
ax.XLim = [12 24];

ax.LineWidth = 1.5;
ax.FontSize = 16;
set(gca,'box','off')
legend('','','','');
legend('boxoff')

print('DHM - WAXS.png', '-dpng','-r600');
print('DHM - WAXS.emf', '-dmeta','-r600');
print('DHM - WAXS.svg', '-dsvg','-r600');

% Saving options in order of reccomendation - Uncomment (ctrl+t/ctrl+r) to activate
saveas(fig,'DHM - WAXS.fig'); % Matlab format