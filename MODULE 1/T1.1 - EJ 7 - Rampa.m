% TEMA 1.1 - EJ 7 - RAMPA
clear all;
close all;

%Pasos
n=-10:10;
t=-10:0.01:10;

%Funciones Rampa
rt= t.*(t>0);
rn= n.*(n>0); %discreta

figure;

plot(t,rt,"r");
hold on
stem(n,rn,"b");

%Adornos
ylabel('A')
xlabel('T')
title("Señal Rampa")

lg= legend('Continua', 'Discreta')
set(lg, "location", "northwest")


