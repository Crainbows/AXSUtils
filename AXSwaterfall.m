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


Script to make waterfall plot for temperature trend DLS
Import size data into vector particleSize (typically 69x1 double)
Import temperature data into vector temp 1x(((maxtemp - mintemp)/gradient)+1) double
Import Intensity data into matrix with matching dimentions (multi measurment data may need to be reduced by averaging and removing outliers)


%}

% Figure setup and properties
figure;
fig = gcf;
fig.Color = 'w';

% xaxis - q - Vector matching columns of results
% yxaxis - Temperature - Vector matching rows of results
% zaxis - Intensity - matrix matching dimentions of size and temperature (use .' to transpose)

w = waterfall(q,temp,results.');

% Setting colours along the Y axis
w.CData = repmat(temp,1,length(w.CData))';

cmap(1,:) = [0 0 1];   %// colour first row - Blue
cmap(2,:) = [1 0 0];   %// colour 25th row - Red
cmap(3,:) = [0 0 1];   %// colour 50th row - Blue

[X,Y] = meshgrid([1:3],[1:50]);  %// mesh of indices

cmap = interp2(X([1,25,50],:),Y([1,25,50],:),cmap,X,Y); %// interpolate colormap

% cmap(1,:) = [0 0 1];   %// colour first row - Blue
% cmap(2,:) = [0.698039216 0.705882353 0];   %// colour 25th row - Yellow
% cmap(3,:) = [1 0 0];   %// colour 50th row - Red
% cmap(4,:) = [0.698039216 0.705882353 0];   %// colour 75th row - Yellow
% cmap(5,:) = [0 0 1];   %// colour 100th row - Blue
% 
% [X,Y] = meshgrid([1:3],[1:100]);  %// mesh of indices
% 
% cmap = interp2(X([1,25,50,75,100],:),Y([1,25,50,75,100],:),cmap,X,Y); %// interpolate colormap

colormap(cmap)

clearvars X Y cmap




% Turn the grid display off
grid off;

% Setting X and Y axis limits
ax = gca;
ax.ZLim = [0 0.0005]; % Intensity Limits
ax.XLim = [0.04 0.3]; % q value Limits
ax.YLim = [-60 70]; % Temperature Limits

% Setting Ticks and Labels on the Axes
yticks([-60 5 70]);
yticklabels({'-60', '70', '-60'})
xticks(0.05:0.05:0.3);
zticks(0:0.0001:0.0005);

% Line Width
w.LineWidth = 1.5;
ax.LineWidth = 1.5;
ax.FontSize = 16;

% Setting axis Labels
% x-axis label adjusted right to match centre of axis
xlabel('q (Å^{-1})');
% y-axis label adjusted
ylabel('Temperature (\circC)')%,'Position',[20000 20 5]);
zlabel('Relative Intensity') % y-axis label


% Camera modifications
% set(gca,'CameraViewAngle',8);
view([25 30]);
% camzoom(0.8);


% High resolution images 600 dpi

% print('DHM - SAXS 2.png', '-dpng','-r600');
% print('DHM - SAXS 2.emf', '-dmeta','-r600');
% print('DHM - SAXS 2.svg', '-dsvg','-r600');


% Saving options in order of reccomendation - Uncomment (ctrl+t/ctrl+r) to activate

% saveas(fig,'DHM - SAXS 2.fig'); % Matlab format
% saveas(fig,'DHM - SAXS 1.svg'); % Scaleable vector graphic
% saveas(fig,'DHM - SAXS 1.png'); % Portable network graphic
% saveas(fig,'filename.bmp'); % Bitmap
% saveas(fig,'filename.jpg'); % Jpeg





