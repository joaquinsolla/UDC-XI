% TEMA 1.1 - EJ 7 - ESCALON
clear all;
close all;

% Pasos
n=-10:10;
t=-10:0.01:10;

%Funciones escalon
xt= 2*(t>0);
xn= 2*(n>=0); %discreta

figure;

plot(t,xt,"r");
hold on;
stem(n,xn,"b"); %discreta

%Adornos 
xlabel('T');
ylabel('A');
title("Señal Escalón");

lg= legend('Continua', 'Discreta')
set(lg, "location", "northwest")
