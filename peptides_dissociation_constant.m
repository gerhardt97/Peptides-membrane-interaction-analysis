% Dissociation constant of peptides fitting and calculation

clc,clear
syms t w

u1=[0;1;2;2.5;3;4;6;7;8;9;10];
x1=u1*1000/2025.48 % Peptides concentration (μM)
y1=[0;0.003104;0.012596;0.038336;0.1314;0.404937;0.589569;0.693764;0.630472;0.689346;0.753836];
% Ratio of bound peptides at different concentrations to maximum level of binding
f1=fittype('w^a/(w^a+b)','independent','w','coefficients',{'a','b'});
% Hill-Langmuir equation
cfun=fit(x1,y1,f1)
xi=0:0.01:7.4157;
yi=cfun(xi);

u2=[0;1;1.5;1.7;2;3;4;5;6];
x2=u2*1000/2110.59
y2=[0;0.012519;0.050479;0.351666;0.551299;0.839267;0.797741;0.866967;0.869655];
f2=fittype('t^a/(t^a+b)','independent','t','coefficients',{'a','b'}); 
cfun=fit(x2,y2,f2)
xii=0:0.01:7.4157;
yii=cfun(xii);

u3=[0;1;2;4;8;16]
x3=u3*1000/2157.58
y3=[0;0.013913645;0.026371669;0.031065411;0.023249175;0.13408554]
xx=0:0.01:7.4157;
yy=interp1(x3,y3,xx); % Leg2 cannot be fitted by Hill's equation, interp1 function was used to connect them


plot(x1,y1,'s',xi,yi,'c-','LineWidth',2) %KTA
hold on
plot(x2,y2,'r*',xii,yii,'b-','LineWidth',2) %KTR
hold on
plot(x3,y3,'o',xx,yy,'LineWidth',2) %Leg2
grid on
xlabel 'Peptides concentration (μM)'
ylabel 'Percentage of peptides binding'
legend('KTA Raw Data','Fitting Curve 1','KTR Raw Data','Fitting Curve 2','Leg2 Raw Data',' Fitting Curve 3')