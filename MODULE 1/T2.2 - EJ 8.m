% TEMA 2.2 - EJ 8
clear all;
close all;

%Variables
T= 0.1;
fs= 48000;
t= 1/fs:1/fs:T;
A1= 0.1;
A2= 0.1;
A3= 0.2;
A4= 0.2;
f1= 200;
f2= 2*f1;
f3= 3*f1;
f4= 4*f1;

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

%APLICAR FILTRO PASO BANDA A xt 
%(RESTANDO 2 FILTROS PASO BAJO)

flow= 400;
fhigh= 700; 
L= length(t);

Hdef1= zeros(1,L/2); %Definición del filtro1
Hdef1(1:flow/fs*L)= ones(1,flow/fs*L);
Hdef1= [fliplr(Hdef1) Hdef1];

Hdef2= zeros(1,L/2); %Definición del filtro2
Hdef2(1:fhigh/fs*L)= ones(1,fhigh/fs*L);
Hdef2= [fliplr(Hdef2) Hdef2];


Ydef1= Xfxt.*Hdef1; %Filtrado en frecuencia
Ydef2= Xfxt.*Hdef2; %Filtrado en frecuencia

ydet1= ifft(fftshift(Ydef1)); %Calculo de la TF inversa
ydet1= real(ydet1);

ydet2= ifft(fftshift(Ydef2)); %Calculo de la TF inversa
ydet2= real(ydet2);

fpaso= abs(Ydef2)/max(abs(Ydef2))-abs(Ydef1)/max(abs(Ydef1)); %Filtro paso banda resultante
yfiltrada= ydet2-ydet1;

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
title('Modulo de TF de xt + Filtros');
axis([-1000 1000 0 1.1]);
hold on
plot(f,abs(Hdef1),'g');
axis([-1000 1000 0 1.1])
plot(f,abs(Hdef2),'r');
axis([-1000 1000 0 1.1])

subplot(4,1,3);
plot(f,fpaso);
xlabel('Frecuencia (Hz)');
ylabel('Modulo');
title('Modulo de TF filtrado');
axis([-1000 1000 0 1.1])

subplot(4,1,4);
plot(t,yfiltrada);
xlabel('tiempo');
ylabel('Amplitud');
title('senal xt(t) filtrada');
axis([0 0.1 -0.5 0.5])