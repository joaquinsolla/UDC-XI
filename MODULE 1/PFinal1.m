% PRACTICA FINAL MODULO 1
clear all;
close all;

%FRECUENCIAS DE SENAL
f1= 150;
f2= 300;
f3= 450;
f4= 550;
%AMPLITUDES
A1= 0.5; 
A2= 0.5;
A3= 1;
A4= 1;
%FILTROS
flow= 400;      %Frecuencia de corte F.P.Bajo
fhigh= 200;     %Frecuencia de corte F.P.Alto
tipoFiltro= 3;  %1 P.Bajo, 2 P.Alto, 3 B.Ideal, 4 B.Eliminada

listen= 0;      %1 para escuchar las senales

fs= 48000;                %Freq. de muestreo
T= 1;                     %Duración de las senales en segundos
t= 1/fs:1/fs:T;           %Vector eje tiempo
L= length(t);             %Longitud del vector t (igual a fs*T)
f= -fs/2+fs/L:fs/L:fs/2;  %Declaración del eje de frecuencias

% PASO 1 - GENERACION DE LA ENTRADA EN EL DOMINIO DEL TIEMPO -------------------

x1t= A1*cos(2*pi*f1*t);   %Generación de la senal
x2t= A2*cos(2*pi*f2*t);
x3t= A3*cos(2*pi*f3*t);
x4t= A4*cos(2*pi*f4*t);
suma= x1t+x2t+x3t+x4t;    %Suma de las senales
%suma= suma+randn(1,L);    %Ruido Gaussiano

if (listen==1)
  sound(x1t,fs);
  sound(x2t,fs);
  sound(x3t,fs);
  sound(x4t,fs);
  sound(suma,fs);
end

% PASO 2 - REPRESENTACION DE LA ENTRADA EN EL DOMINIO DE LA FRECUENCIA ---------

%Transformadas de Fourier:
Xdef1=fftshift(fft(x1t));     % Transformada de Fourier de x1t
Xdef2=fftshift(fft(x2t));
Xdef3=fftshift(fft(x3t));
Xdef4=fftshift(fft(x4t));
XdefSuma=fftshift(fft(suma));

% PASO 3 - OBTENCION DE LA RESPUESTA EN FRECUENCIA DE UN FILTRO IDEAL ----------
% Filtro paso BAJO ideal
fBajo= zeros(1,L/2);
fBajo(1:flow/fs*L)= ones(1,flow/fs*L);
fBajo= [fliplr(fBajo) fBajo];
if (tipoFiltro==1)
  filtro=fBajo;
end
% Filtro paso ALTO ideal
fAlto= ones(1,L/2);
fAlto(1:fhigh/fs*L)= zeros(1,fhigh/fs*L);
fAlto= [fliplr(fAlto) fAlto];
if (tipoFiltro==2)
  filtro=fAlto;
end
% Filtro paso BANDA IDEAL
% (Calculado a partir del producto entre fBajo y fAlto)
fBandaI= fBajo.*fAlto;
if (tipoFiltro==3)
  filtro=fBandaI;
end
% Filtro paso BANDA ELIMINADA
fBandaE= 1-fBandaI;
if (tipoFiltro==4)
  filtro=fBandaE;
end

% PASO 4 - OBTENCION DE LA SENAL DE SALIDA EN EL DOMINIO DE LA FRECUENCIA ------
Ydef1=Xdef1.*filtro;
Ydef2=Xdef2.*filtro;
Ydef3=Xdef3.*filtro;
Ydef4=Xdef4.*filtro;
YdefSuma=XdefSuma.*filtro;

% PASO 5 - OBTENCION DE LA SENAL DE SALIDA EN EL DOMINIO DEL TIEMPO
x1tFiltered=ifft(fftshift(Ydef1));  %Transformada de Fourier inversa
x1tFiltered=real(x1tFiltered);
x2tFiltered=ifft(fftshift(Ydef2));  %Transformada de Fourier inversa
x2tFiltered=real(x2tFiltered);
x3tFiltered=ifft(fftshift(Ydef3));  %Transformada de Fourier inversa
x3tFiltered=real(x3tFiltered);
x4tFiltered=ifft(fftshift(Ydef4));  %Transformada de Fourier inversa
x4tFiltered=real(x4tFiltered);
sumaFiltered=ifft(fftshift(YdefSuma));  %Transformada de Fourier inversa
sumaFiltered=real(sumaFiltered);

if (listen==1)
  sound(x1tFiltered,fs);
  sound(x2tFiltered,fs);
  sound(x3tFiltered,fs);
  sound(x4tFiltered,fs);
  sound(sumaFiltered,fs);
end

% PASO 6 - EJECUCION E INTERPRETACION DE LOS RESULTADOS ------------------------
figure('name','ANÁLISIS')
%----x(t)----
subplot(4,1,1);
plot(t,suma);
axis([0 0.1 -5 5]);
xlabel('Tiempo(seg)');
ylabel('Amplitud');
title('x(t)');
%----X(f)----
subplot(4,1,2);
plot(f,abs(XdefSuma)/max(abs(XdefSuma)));   % Módulo de XdefSuma (+ y -)
hold on
plot(f,abs(filtro),'g');
axis([-1000 1000 0 1.1]);
xlabel('Frecuencia (Hz)');
ylabel('Modulo');
title('X(f)');
%----Y(f)----
subplot(4,1,3);
plot(f,abs(YdefSuma)/max(abs(YdefSuma)));
axis([-1000 1000 0 1.1])
xlabel('Frecuencia (Hz)');
ylabel('Modulo');
title('Y(f)')
%----y(t)----
subplot(4,1,4);
plot(t,sumaFiltered);
axis([0 0.1 -5 5])
xlabel('Tiempo(seg)');
ylabel('Amplitud');
title('y(t)');