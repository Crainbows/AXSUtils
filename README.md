# AXSUtils
A Series of MATLAB scripts for use with VT-SAXS and VT-WAXS data

# Usage

## AXSwaterfall
Used for plotting VT-SAXS and VT-WAXS data in 3 dimensions.

Store q values in a numeric matrix named q with dimentions [X &times; 1]

Store temperature values in a numeric matrix named temperature. [Y &times; 1] This can be achieved by creating a numeric array from the lowest value to the highest as shown below.
Cool-Heat cycle
```matlab
temperature = -60:(130/76):70 % Lowest to highest in increments of (temperature range over number of measurements)
temperature = temp.' % Transpose array
```
Cool-Heat-Cool Cycle
```matlab
temperature = -60:(260/156):70 % Lowest to highest in increments of (2 &times; temperature range over number of measurements)
temperature = temp.' % Transpose array
temperature = vertcat(temperature, sort(temperature, 'descend')) % Append inverted array
```

Store results in a numeric matrix named results. [X &times; Y] Use `.'` at the end of the variable name if the dimensions are incorrect.

Once the variables are decleared call AXSwaterfall from the MATLAB command line.

### Advanced Changes

```matlab
w = waterfall(q,temp,results.');
```
The colour setup is based on a cold-hot-cold ramp and goes from Blue-Red-Blue this can be altered by adjusting the RGB values in the matrix.

```matlab
cmap(1,:) = [0 0 1];   %// colour first row - Blue
cmap(2,:) = [1 0 0];   %// colour 25th row - Red
cmap(3,:) = [0 0 1];   %// colour 50th row - Blue
```
A limitation of YLim is that it can't account for cold-hot-cold ramps. In this instance we just ensure the values cover an interger range that matches the initial temperature. In order to correctly label the axes we simply use Ytick and Yticklabels.
```matlab
yticks([-60 5 70]); % Ticks at the start middle and end of the YLim defined earlier.
yticklabels({'-60', '70', '-60'}); % Tick labels. Quantity must match number of ticks declared.
```
Setting the camera view is based on two variables which are angles around the centre of all axes.
```matlab
view([25 30]);
```

High quality images can be produced using the print options where DPI can be defined. Alternatively standard quality can be yielded using the saveas funtions. These have already been predefined but can be adjusted where needed.


## AXSplot

TODO

# License

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