%{

MIT License

Copyright (c) 2018 Oliver Balmford

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

%}


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