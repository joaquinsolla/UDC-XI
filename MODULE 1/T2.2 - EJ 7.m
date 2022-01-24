% TEMA 2.2 - EJ 7
clear all;
close all;

%Variables
T= 0.1;
fs= 48000;
t= 1/fs:1/fs:T;
A1= 0.1;
A2= 0.1;
A3= 0.1;
A4= 0.1;
f1= 440;
f2= 550;
f3= 660;
f4= 880;

%Funciones
x1t= A1*cos(2*pi*f1*t);
x2t= A2*cos(2*pi*f2*t);
x3t= A3*cos(2*pi*f3*t);
x4t= A4*cos(2*pi*f4*t);
xt= x1t+x2t+x3t+x4t;

%TRANSFORMADAS DE FOURIER
Ls= length(t);
f= -fs/2+fs/Ls:fs/Ls:fs/2;  %Eje de frecuencias

Xf1= fftshift(fft(x1t));    %Transformada de Fourier de x1t
Xf2= fftshift(fft(x2t));    %Transformada de Fourier de x2t
Xf3= fftshift(fft(x3t));    %Transformada de Fourier de x3t
Xf4= fftshift(fft(x4t));    %Transformada de Fourier de x3t
Xfxt= fftshift(fft(xt));    %Transformada de Fourier de xt

figure(1);
subplot(5,1,1);
plot(t,x1t);
xlabel('tiempo');
ylabel('Amplitud');
title('senal x1(t)');
axis([0 0.1 -0.5 0.5]);

subplot(5,1,2);
plot(t,x2t);
xlabel('tiempo');
ylabel('Amplitud');
title('senal x2(t)');
axis([0 0.1 -0.5 0.5]);

subplot(5,1,3);
plot(t,x3t);
xlabel('tiempo');
ylabel('Amplitud');
title('senal x3(t)');
axis([0 0.1 -0.5 0.5]);

subplot(5,1,4);
plot(t,x4t);
xlabel('tiempo');
ylabel('Amplitud');
title('senal x4(t)');
axis([0 0.1 -0.5 0.5]);

subplot(5,1,5);
plot(t,xt);
xlabel('tiempo');
ylabel('Amplitud');
title('senal xt(t)');
axis([0 0.1 -0.5 0.5]);

figure(2);
subplot(5,1,1);
plot(f,abs(Xf1)/max(abs(Xf1)));   %Dibujo del módulo de Xf1
xlabel('Frecuencia (Hz)');
ylabel('Modulo');
title('Modulo de TF de x1t');
axis([-1000 1000 0 1.1]);

subplot(5,1,2);
plot(f,abs(Xf2)/max(abs(Xf2)));   %Dibujo del módulo de Xf2
xlabel('Frecuencia (Hz)');
ylabel('Modulo');
title('Modulo de TF de x2t');
axis([-1000 1000 0 1.1]);

subplot(5,1,3);
plot(f,abs(Xf3)/max(abs(Xf3)));   %Dibujo del módulo de Xf3
xlabel('Frecuencia (Hz)');
ylabel('Modulo');
title('Modulo de TF de x3t');
axis([-1000 1000 0 1.1]);

subplot(5,1,4);
plot(f,abs(Xf4)/max(abs(Xf4)));   %Dibujo del módulo de Xf4
xlabel('Frecuencia (Hz)');
ylabel('Modulo');
title('Modulo de TF de x4t');
axis([-1000 1000 0 1.1]);

subplot(5,1,5);
plot(f,abs(Xfxt)/max(abs(Xfxt)));   %Dibujo del módulo de Xfxt
xlabel('Frecuencia (Hz)');
ylabel('Modulo');
title('Modulo de TF de xt');
axis([-1000 1000 0 1.1]);

%-------------------------------------------------------------------------------

%APLICAR FILTRO PASO BAJO A xt

flow= 600;   %Frecuencia de corte

L= length(t);
Hdef= zeros(1,L/2); %Definición del filtro
Hdef(1:flow/fs*L)= ones(1,flow/fs*L);
Hdef= [fliplr(Hdef) Hdef];

Ydef= Xfxt.*Hdef; %Filtrado en frecuencia

ydet= ifft(fftshift(Ydef)); %Calculo de la TF inversa
ydet= real(ydet);

figure(3);
subplot(4,1,1);
plot(t,xt);
xlabel('tiempo');
ylabel('Amplitud');
title('senal xt(t)');
axis([0 0.1 -0.5 0.5]);

subplot(4,1,2);
plot(f,abs(Xfxt)/max(abs(Xfxt)));   %Dibujo del módulo de Xfxt
xlabel('Frecuencia (Hz)');
ylabel('Modulo');
title('Modulo de TF de xt + Filtro');
axis([-1000 1000 0 1.1]);
hold on
plot(f,abs(Hdef),'g');
axis([-1000 1000 0 1.1])

subplot(4,1,3);
plot(f,abs(Ydef)/max(abs(Ydef)));
xlabel('Frecuencia (Hz)');
ylabel('Modulo');
title('Modulo de TF filtrado');
axis([-1000 1000 0 1.1])

subplot(4,1,4);
plot(t,ydet);
xlabel('tiempo');
ylabel('Amplitud');
title('senal xt(t) filtrada');
axis([0 0.1 -0.5 0.5])