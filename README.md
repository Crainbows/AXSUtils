# AXSUtils
A Series of MATLAB scripts for use with VT-SAXS and VT-WAXS data

# Usage

## AXSwaterfall
Used for plotting VT-SAXS and VT-WAXS data in 3 dimensions.

Store q values in a numeric matrix named q with dimentions [X &times; 1]

Store temperature values in a numeric matrix named temp. [Y &times; 1]

Store results in a numeric matrix named results. [X &times; Y] Use `.'` at the end of the variable name if the dimensions are incorrect.

```matlab
w = waterfall(q,temp,results.');
```
The colour setup is based on a cold-hot-cold ramp and goes from Blue-Red-Blue this can be altered by adjusting the RGB values in the matrix.

```matlab
cmap(1,:) = [0 0 1];   %// colour first row - Blue
cmap(2,:) = [1 0 0];   %// colour 25th row - Red
cmap(3,:) = [0 0 1];   %// colour 50th row - Blue
```

## AXSplot



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