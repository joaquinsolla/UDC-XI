% TEMA 1.2 - EJ 11
clear all;
close all;

%APARTADO A

%Variables
fs= 20000;        %Frec muestreo
Ls= 1;            %Duracion senal en segs
t= 1/fs:1/fs:Ls;  %Vector tiempo
A1= 1;
A2= 1;
A3= 1;
f1= 330;
f2= 2*f1;
f3= 3*f1;

%Funciones
x1t= A1*cos(2*pi*f1*t);
x2t= A2*cos(2*pi*f2*t);
x3t= A3*cos(2*pi*f3*t);
suma= x1t+x2t+x3t;

figure(1);
subplot(4,1,1);
plot(t,x1t);
xlabel('tiempo',"Fontsize",10);
ylabel('Amplitud',"Fontsize",10);
title("Señal x1(t): A=1 f=330 Hz");
axis([0,0.05,-2,2]);

subplot(4,1,2);
plot(t,x2t);
xlabel('tiempo',"Fontsize",10);
ylabel('Amplitud',"Fontsize",10);
title("Señal x2(t): A=1 f=660 Hz");
axis([0,0.05,-2,2]);

subplot(4,1,3);
plot(t,x3t);
xlabel('tiempo',"Fontsize",10);
ylabel('Amplitud',"Fontsize",10);
title("Señal x3(t): A=1 f=990 Hz");
axis([0,0.05,-2,2]);

subplot(4,1,4);
plot(t,suma);
xlabel('tiempo',"Fontsize",10);
ylabel('Amplitud',"Fontsize",10);
title("Señal Suma");
axis([0,0.05,-2,4]);

%APARTADO B

%Variables (modificadas)
A1= 1;
A2= 1;
A3= 2;

%Funciones
x1t= A1*cos(2*pi*f1*t);
x2t= A2*cos(2*pi*f2*t);
x3t= A3*cos(2*pi*f3*t);
suma= x1t+x2t+x3t;

figure(2);
subplot(4,1,1);
plot(t,x1t);
xlabel('tiempo',"Fontsize",10);
ylabel('Amplitud',"Fontsize",10);
title("Señal x1(t): A=1 f=330 Hz");
axis([0,0.05,-2,2]);

subplot(4,1,2);
plot(t,x2t);
xlabel('tiempo',"Fontsize",10);
ylabel('Amplitud',"Fontsize",10);
title("Señal x2(t): A=1 f=660 Hz");
axis([0,0.05,-2,2]);

subplot(4,1,3);
plot(t,x3t);
xlabel('tiempo',"Fontsize",10);
ylabel('Amplitud',"Fontsize",10);
title("Señal x3(t): A=2 f=990 Hz");
axis([0,0.05,-2,2]);

subplot(4,1,4);
plot(t,suma);
xlabel('tiempo',"Fontsize",10);
ylabel('Amplitud',"Fontsize",10);
title("Señal Suma");
axis([0,0.05,-2,4]);

%APARTADO C

%Variables (modificadas)
A1= 1;
A2= 1;
A3= -1;

%Funciones
x1t= A1*cos(2*pi*f1*t);
x2t= A2*cos(2*pi*f2*t);
x3t= A3*cos(2*pi*f3*t);
suma= x1t+x2t+x3t;

figure(3);
subplot(4,1,1);
plot(t,x1t);
xlabel('tiempo',"Fontsize",10);
ylabel('Amplitud',"Fontsize",10);
title("Señal x1(t): A=1 f=330 Hz");
axis([0,0.05,-2,2]);

subplot(4,1,2);
plot(t,x2t);
xlabel('tiempo',"Fontsize",10);
ylabel('Amplitud',"Fontsize",10);
title("Señal x2(t): A=1 f=660 Hz");
axis([0,0.05,-2,2]);

subplot(4,1,3);
plot(t,x3t);
xlabel('tiempo',"Fontsize",10);
ylabel('Amplitud',"Fontsize",10);
title("Señal x3(t): A=-1 f=990 Hz");
axis([0,0.05,-2,2]);

subplot(4,1,4);
plot(t,suma);
xlabel('tiempo',"Fontsize",10);
ylabel('Amplitud',"Fontsize",10);
title("Señal Suma");
axis([0,0.05,-2,2]);