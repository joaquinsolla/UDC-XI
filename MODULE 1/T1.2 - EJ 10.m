% TEMA 1.2 - EJ 10
clear all;
close all;

%Variables
f= 20;        %Frecuencia senal
fs= 1000;     %Frecuencia de muestreo
t= -1:1/fs:1;  %Vector tiempo (paso)

Ts= 1/fs;     %Periodo de muestreo

%Funciones
%xt= (cos(2*pi*f*t)) * (t>0)
x1t= cos(2*pi*f*t);
ut= (t>=0);
xt= x1t.*ut;

figure;

subplot(3,1,1);
plot(t,x1t);
xlabel('Tiempo',"Fontsize",10);
ylabel('Amplitud',"Fontsize",10);
title("x1(t)");

subplot(3,1,2);
plot(t,ut);
xlabel('Tiempo',"Fontsize",10);
ylabel('Amplitud',"Fontsize",10);
title("u(t)");

subplot(3,1,3);
plot(t,xt);
xlabel('Tiempo',"Fontsize",10);
ylabel('Amplitud',"Fontsize",10);
title("x(t)")