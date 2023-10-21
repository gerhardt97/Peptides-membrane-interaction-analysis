% Second-order Gaussian Model is used to analyses tether radius of GUVs
% This code is combined with 'Photon_count_per_pixel.py'

% input x and y values as matrix
x = xlsread('filename', 'sheet', 'range')
y = xlsread('filename', 'sheet', 'range')

% Gauss fitting
f = fit(x.',y.','gauss2')

% plot image
plot(f,x,y)
xlabel('pixels')
ylabel('photon counts')