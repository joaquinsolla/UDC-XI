% TEMA 1.1 - EJ 7 - RAMPA
clear all;
close all;

%Pasos
n=-10:10;
t=-10:0.01:10;

%Variables
a1=1;
a2=-1;

%Funciones Exponenciales
xt1=(exp(-a1*t)).*(t>0);
xn1=(exp(-a1*n)).*(n>=0);  %Discreta

xt2=(exp(-a2*t)).*(t>0);
xn2=(exp(-a2*n)).*(n>=0);  %Discreta

figure

subplot(2,1,1)
plot(t,xt1,"r");
hold on
stem(n,xn1,"b")

xlabel('T');
ylabel('A');
title("Exponencial unilateral (a=1)");

lg= legend('Continua', 'Discreta')
set(lg, "location", "northwest")


subplot(2,1,2)
plot(t,xt2,"r");
hold on
stem(n,xn2,"b")

xlabel('T');
ylabel('A');
title("Exponencial unilateral (a=-1)");

lg= legend('Continua', 'Discreta')
set(lg, "location", "northwest")
