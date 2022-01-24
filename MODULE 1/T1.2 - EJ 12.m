% TEMA 1.2 - EJ 12
clear all;
close all;

%Importar audio
[xdet,fs]= audioread('ejemplo.wav');
%sound(xdet,fs);

%Variables
%fs= frec muestreo
%xdet= muestras de audio
N= length(xdet);   %Numero muestras de audio
T= N/fs;           %Duracion de la senal de audio
t=1/fs:1/fs:T;

%APARTADO A
figure(1);
plot(t,xdet);
title("Señal x(n)=[x(1)x(2)...x(N)]");

%APARTADO B
ydet= 2*xdet;
figure(2);
plot(t,ydet);
title("Señal y(n)=2x(n)");

%APARTADO C
zdet= xdet(end:-1:1);
figure(3);
plot(t,zdet);
title("Señal z(n)=[x(N)x(N-1)...x(1)]");


