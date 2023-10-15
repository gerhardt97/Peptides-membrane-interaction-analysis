% Partition coefficients of antimicrobial peptides by zeta-potential

clc,clear
syms r v m
u1=[1;2;2.5;3;4;6;7;8;9;10]; 
x1=u1*1000/2025.48 % Peptides concentration (μM)
y1=[0.934211;0.904971;0.864035;0.824561;0.663743;0.461988;0.397076;0.337719;0.280556;0.23848] % Normalized zeta potential
y11=-22.8*y1

u2=[1;1.5;1.7;2;3;4;5;6];
x2=u2*1000/2110.59
y2=[0.95122;0.942611;0.941176;0.935438;0.908178;0.890961;0.839311;0.799139]
y22=-23.2333*y2

u3=[1;2;4;8;16]
x3=u3*1000/2157.58
y3=[0.985135135;0.956756757;0.944594595;0.891891892;0.845945946]


f1=fittype('a*r+1','independent','r','coefficients',{'a'})
cfun=fit(x1,y1,f1)
xi=0:0.001:8;
yi=cfun(xi);

f2=fittype('a*v+1','independent','v','coefficients',{'a'})
cfun=fit(x2,y2,f2)
xii=0:0.001:8;
yii=cfun(xii);

f3=fittype('a*m+1','independent','m','coefficients',{'a'})
cfun=fit(x3,y3,f3)
xiii=0:0.001:8;
yiii=cfun(xiii);

plot(x1,y1,'s',xi,yi,'c-','LineWidth',2)
hold on
plot(x2,y2,'r*',xii,yii,'b-','LineWidth',2)
grid on
plot(x3,y3,'o',xiii,yiii,'LineWidth',2)
grid on
xlabel 'Peptides concentration (μM)'
ylabel 'Normalized Zeta-potential'
legend('KTA Raw Data','Fitting Curve 1','KTR Raw Data','Fitting Curve 2','Leg2 Raw Data','Fitting Curve 3')