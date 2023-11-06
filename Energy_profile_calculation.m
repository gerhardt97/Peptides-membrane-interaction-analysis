clc, clear all

[x]=xlsread('C:\Users\yzh74\Optical Tweezers Results Analysis\trap_position.csv') 
[y]=xlsread('C:\Users\yzh74\Optical Tweezers Results Analysis\force.csv') 

% Creating spline function to represent F-D curve
xx=linspace(x(1),x(max),100);
yy=spline(x,-y,xx);
%%
% Calculating energy profile from the integral of the force-distance curve
G1 = []
for i = 1:100
    u = xx(i)
    G = integral(@(xx)spline(x,-y,xx),xx(1),u,'ArrayValued',true)
    G1 = [G1,G]
end
disp(G1)
%%
% Plot F-D curve and G-D curve
plot(xx,yy)
hold on
plot(xx,G1,"b-")
hold off