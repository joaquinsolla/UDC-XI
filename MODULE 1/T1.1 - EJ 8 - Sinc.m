% TEMA 1.1 - EJ 8 - COSENO
clear all;
close all;

%Pasos
t= n= -10:0.1:10;

%Funciones
xt= (sin(pi*t)) ./ (pi*t);
xn= (sin(pi*n)) ./ (pi*n);  %discreta
xaux= find(n==0);
xn(xaux)=1;

figure;

plot(t,xt,"r");
hold on
stem(n,xn,"b");
stem(n,xaux,"b");

%Adornos
xlabel('T');
ylabel('A');
title("Señal Sinc");

lg= legend('Continua', 'Discreta')
set(lg, "location", "northwest")