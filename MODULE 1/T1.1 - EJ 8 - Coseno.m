% TEMA 1.1 - EJ 8 - COSENO
clear all;
close all;

%Pasos
t= n= 0:0.001:0.1;

%Variables
f= 20;

%Funciones
xt= cos(2*pi*f*t);
xn= cos(2*pi*f*n);  %discreta

figure;

plot(t,xt,"r");
hold on
stem(n,xn,"b");

%Adornos
xlabel('T');
ylabel('A');
title("Señal Coseno (Frecuencia 20 Hz)");

lg= legend('Continua', 'Discreta')
set(lg, "location", "northwest")