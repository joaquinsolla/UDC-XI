% TEMA 1.1 - EJ 7 - PULSO
clear all;
close all;

%Pasos
n=-10:10;
t=-10:0.01:10;

%Variables
A=3;
T=N=4;

%Funciones Pulso
pt= A*((t>0)&(t<T));
pn= A*((n>=0)&(n<N)); %discreta

figure;

plot(t, pt, "r")
hold on
stem(n, pn, "b")  %discreta

%Adornos
xlabel('T');
ylabel('A');
title("Pulso Unidad (T=4, A=3)");

legend("location", "northwest")
legend("show");