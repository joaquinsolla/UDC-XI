% TEMA 2.2 - EJ 8
clear all;
close all;

%Variables
T= 0.1;   %Duración de la senal en segs
fs= 5000; %Frecuencia de muestreo
f1= 100;
t= 1/fs:1/fs:T;
Ls= length(t);
f= -fs/2+fs/Ls:fs/Ls:fs/2;

%Funciones
xt= cos(2*pi*f1*t);

figure;
subplot(2,1,1);
stem(t,xt,'b');
hold on;
plot(t,xt,'r');
axis([0 0.1 -1 1]);
xlabel('tiempo'); 
ylabel('Amplitud');
title('Senal x(t)');

%-----------------------------------------------------

%Variables
fs= 100; %Frecuencia de muestreo
t= 1/fs:1/fs:T;
Ls= length(t);
f= -fs/2+fs/Ls:fs/Ls:fs/2;

xt= cos(2*pi*f1*t);

subplot(2,1,2);
stem(t,xt,'b');
hold on;
plot(t,xt,'r');
axis([0 0.1 -1 1]);
xlabel('tiempo'); 
ylabel('Amplitud');
title('Senal x(t)');
