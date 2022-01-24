% TEMA 2.1 - EJ 14
clear all;
close all;

%Importar audio
[xdet,fs]= audioread('ejemplo.wav');

%Variables
T= 8;
t= 1/fs:1/fs:T;
Ls= length(t);

%TRANSFORMADAS DE FOURIER
f= -fs/2+fs/Ls:fs/Ls:fs/2;  %Eje de frecuencias
Xf= fftshift(fft(xdet));    %Transformada de Fourier


%REPRESENTAR TRANSFORMADAS DE FOURIER
figure;
subplot(2,1,1);
%Senal x1t
plot(t,xdet);
xlabel('tiempo');
ylabel('Amplitud');
title('Senal de audio');
%Modulo TF
subplot(2,1,2);
plot(f,abs(Xf)/max(abs(Xf)));   %Dibujo del módulo de xdet
xlabel('Frecuencia (Hz)');
ylabel('Modulo');
title('Modulo de TF');
axis([-1000 1000 0 1.1]);
