% TEMA 2.1 - EJ 13
clear all;
close all;

%Variables generales
T= 0.1;
fs= 48000;
t= 1/fs:1/fs:T;

%Variables (A)
A1= 1;
A2= 1;
A3= 1;
f1= 220;
f2= 2*f1;
f3= 3*f1;
Ls= length(t);

%Funciones
x1t= A1*cos(2*pi*f1*t);
x2t= A2*cos(2*pi*f2*t);
x3t= A3*cos(2*pi*f3*t);
suma= x1t+x2t+x3t;
%Añadir ruido blanco gaussiano
suma= suma+randn(1,Ls);


%TRANSFORMADAS DE FOURIER
f= -fs/2+fs/Ls:fs/Ls:fs/2;  %Eje de frecuencias

Xf1= fftshift(fft(x1t));    %Transformada de Fourier de x1t
Xf2= fftshift(fft(x2t));    %Transformada de Fourier de x2t
Xf3= fftshift(fft(x3t));    %Transformada de Fourier de x3t
Xfsum= fftshift(fft(suma));    %Transformada de Fourier de suma

%REPRESENTAR TRANSFORMADAS DE FOURIER
figure;
subplot(4,2,1);
%Senal x1t
plot(t,x1t);
xlabel('tiempo');
ylabel('Amplitud');
title('senal x1(t)');
axis([0 0.05 -2 2]);
%Modulo TF
subplot(4,2,2);
plot(f,abs(Xf1)/max(abs(Xf1)));   %Dibujo del módulo de Xf1
xlabel('Frecuencia (Hz)');
ylabel('Modulo');
title('Modulo de TF de x1t');
axis([-1000 1000 0 1.1]);

subplot(4,2,3);
%Senal x2t
plot(t,x2t);
xlabel('tiempo');
ylabel('Amplitud');
title('senal x2(t)');
axis([0 0.05 -2 2]);
%Modulo TF
subplot(4,2,4);
plot(f,abs(Xf2)/max(abs(Xf2)));   %Dibujo del módulo de Xf2
xlabel('Frecuencia (Hz)');
ylabel('Modulo');
title('Modulo de TF de x2t');
axis([-1000 1000 0 1.1]);

subplot(4,2,5);
%Senal x3t
plot(t,x3t);
xlabel('tiempo');
ylabel('Amplitud');
title('senal x3(t)');
axis([0 0.05 -2 2]);
%Modulo TF
subplot(4,2,6);
plot(f,abs(Xf3)/max(abs(Xf3)));   %Dibujo del módulo de Xf3
xlabel('Frecuencia (Hz)');
ylabel('Modulo');
title('Modulo de TF de x3t');
axis([-1000 1000 0 1.1]);

subplot(4,2,7);
%Senal suma
plot(t,suma);
xlabel('tiempo');
ylabel('Amplitud');
title('senal suma');
axis([0 0.05 -4 4]);
%Modulo TF
subplot(4,2,8);
plot(f,abs(Xfsum)/max(abs(Xfsum)));   %Dibujo del módulo de suma
xlabel('Frecuencia (Hz)');
ylabel('Modulo');
title('Modulo de TF de suma');
axis([-1000 1000 0 1.1]);