% TEMA 3.1 - EJ 11
clear all;
close all;

%Variables
A= 4;
f= 100;
fs= 2000;
T= 0.02;
M= 8;

t= 1/fs:1/fs:T;

%Funciones
xt= A*cos(2*pi*f*t) + A;
Q= (max(xt) - min(xt))/M;   %CUANTIFICADOR
y= round(xt./Q);   %IMPLEMENTAR CUANTIFICADOR

r= y.*Q;    %Senal reconstruida

figure;
subplot(2,1,1);
plot(t,xt,"r");
hold on;
stem(t,y,"b");



for w= 1/fs:1/fs:T
  Ec = mean(abs(xt-y))
  Er = mean(abs(xt-r))
end;



subplot(2,1,2);
plot(t,Ec,'r');
hold on;
plot(t,Er,'b');
axis([0 0.03 -0.1 0.1]);

