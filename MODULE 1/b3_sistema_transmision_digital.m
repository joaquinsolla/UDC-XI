%%%%%%           SISTEMA DE TRANSMISION BANDA BASE         %%%%%%


clear all;
close all;

%=================== Parametros ==================================
N=10;		 % Periodo de simbolo
L=10;		 % Longitud del pulso
K=1000; % Numero de simbolos	a transmitir
tipopulso=1; %1: pulso rectangular 2: pulso de Nyquist
EbNo=6; % EbNo en dB
W=pi/2;    % Ancho de banda del canal

%=================== Generacion del pulso =========================
n=-L*N:L*N;
if tipopulso == 1
  pulso=[zeros(1,N*L) ones(1,N) zeros(1,N*(L-1)+1)]; %pulso rectangular
else
  pulso=sin(pi*n/N)./(pi*n/N); %pulso de Nyquist
  pos=find(n==0);
  pulso(pos)=1;
end;
[P,Wrad]=b3_dtft(pulso,(2*L*N)+50);

%=================== Generacion del canal ==========================

h=sin(W*n)./(pi*n);
pos=find(n==0);
h(pos)=W/pi;

if (pi/N)>W 
	h=h*pi/W/N;
end;
[H,Wrad]=b3_dtft(h,(2*L*N)+50);

Eb=pulso*pulso';
EbNo=10^(EbNo/10); 	%--Conversion de la EbNo a veces
No=Eb/EbNo;

%=================== PAM  ===========================================
randn(0); rand(0)


% generacion de bits con 0 y 1 equiprobables

x=rand(1,K);   %Generación de valores con distibucion uniforme
bits=(x<=0.5);

% codificacion de la secuencia de bits: 
%          0->+1
%          1->-1
secbits=(bits==0)-(bits==1); 

% generacion de secuencia Ik

secuencia=zeros(1,K*N);      
secuencia(1:N:K*N)=secbits;  %separacion de N

% Modulacion PAM
tx=conv(secuencia,pulso);

%=================== Transmision =====================================
rx=conv(tx,h);

ruido=sqrt(No/2)*randn(1,length(rx));
rx=rx+ruido;

%=================== Representacion ==================================


M=10*N; %Tam de la representacion

figure(1)
ejex=0:K*N-1;
stem(ejex,secuencia);
grid;
axis([0,M,-2,2]);
title('Secuencia de simbolos a transmitir');

figure(2)
subplot(211);
plot(n,pulso);
title('Pulso transmitido: p(n)');
grid;
subplot(212);
plot(Wrad,abs(P)/max(abs(P)));
title('T. de F. del pulso transmitido: P(W)');
grid;
 

figure(3);
txdib=tx(N*L+1:length(tx)-N*L);
plot(ejex,txdib);     
hold on;
stem(ejex,secuencia);    
title('Senal transmitida u(n) y senal s(n)');
grid;
axis([0,M,-2,2]);      

figure(4);
plot(Wrad,abs(P)/max(abs(P)));
grid;
hold on
plot(Wrad,abs(H)/max(abs(H)));
grid;
title('Respuesta en frecuencia del canal H(W) y T.F. del pulso P(W)');
grid;
figure;
 

figure(5);
rxdib=rx(2*N*L+1:length(rx)-2*N*L);
plot(ejex,rxdib);
hold on;
stem(ejex,secuencia);
grid;
title('Senal recibida r(n) y senal s(n)');
axis([0,M,-2,2]);


