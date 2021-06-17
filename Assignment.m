%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Student name: muntherr anati
%Id:182028
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-a-,-b-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
syms t w %symbolic variable t
x1=2*heaviside(t-1)-2*heaviside(t-3);%x1(t)=2u(t-1)-2u(t-3)
% fplot(x1)%plot x1 signal
xlabel('X')
ylabel('Y')
title('X1(t)')
figure
x2=9.*(t-11/3).*heaviside(t-11/3)-18.*(t-4).*heaviside(t-4)+9.*(t-13/3).*heaviside(t-13/3);
%x2(t) =9r(t-11/3)-18r(t-4)+9r(t-13/3)
% fplot(x2)
xlabel('X')
ylabel('Y')
title('X2(t)')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-c-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%DISPLAY FOURIER TRANSFROM FOR EACH SIGNALS%%
X1=(2*heaviside(t-1)-2*heaviside(t-3));
%t= 5;
k1=7*exp(-11*t)*heaviside(t);
FX1=abs(k1);
j= fourier(FX1);

fprintf('Fourier Transform of x1 = ')
disp(j)
X2=(9.*(t-11/3).*heaviside(t-11/3)-18.*(t-4).*heaviside(t-4)+9.*(t-13/3).*heaviside(t-13/3));
FX2=fourier(X2);
fprintf('Fourier Transform of x2 = ')
disp(FX2)
C1=4*cos(120*pi*t);
C=fourier(C1);
fprintf('Fourier Transform of c1 = ')
disp(C)
C2=2*cos(80*pi*t);
CC=fourier(C2);
fprintf('Fourier Transform of c2 = ')
disp(CC)
%%%%%%%%%%%%%%%%%%%%PLOT FOURIER TRANSFORM OF X1 SIGNAL%%%%%%%%%%%%%%%%%%%%
figure
fsx=100;%sampling frequency for x1
tsx=1/fsx;%f=1/t periodic time of x1
t = 0:tsx:2; %function interval
X1=2*heaviside(t-1)-2*heaviside(t-3);%x1 signal
tfx=fftshift(fft(X1));%rearranges a Fourier transform by shifting the zero-frequency component to the center of the c1
fx = -fsx/2:fsx/(length(tfx)-1):fsx/2;%frequency domain
plot(fx,abs(tfx))
 xlabel('Frequency(HZ)')
 ylabel('Magnitude')
title('X1(f)')
%%%%%%%%%%%%%%%%%%%PLOT FOURIER TRANSFORM OF X2 SIGNAL%%%%%%%%%%%%%%%%%%%%
figure
fsx2=100;%sampling frequency of x2
tsx2=1/fsx2;
t = 0:tsx2:5; 
X2=9.*(t-11/3).*heaviside(t-11/3)-18.*(t-4).*heaviside(t-4)+9.*(t-13/3).*heaviside(t-13/3);%
tfx2=fftshift(fft(X2));%rearranges a Fourier transform by shifting the zero-frequency component to the center of the x2
fx2 = -fsx2/2:fsx2/(length(tfx2)-1):fsx2/2;%frequency domain of x2
plot(fx2,abs(tfx2))
xlabel('Frequency(HZ)')
ylabel('Magnitude')
title('X2(f)')
%%%%%%%%%%%%%%%%%%%PLOT FOURIER TRANSFORM OF C1 SIGNAL%%%%%%%%%%%%%%%%%%%%
figure
fs=160;%sampling frequency
ts=1/fs;%f=1/t
t = 0:ts:10; 
c1=4*cos(120*pi*t);
tf=fftshift(fft(c1));%rearranges a Fourier transform by shifting the zero-frequency component to the center of the c1
f = -fs/2:fs/(length(tf)-1):fs/2;%frequency domain
plot(f,abs(tf))
xlabel('Frequency(HZ)')
ylabel('Magnitude')
title('C1(f)')
%%%%%%%%%%%%%%%%%%%PLOT FOURIER TRANSFORM OF C2 SIGNAL%%%%%%%%%%%%%%%%%%%%
figure
 fs2=160;%sampling frequenc
ts2=1/fs2;%f=1/t
t2 = 0:ts2:10;%time range 
c2=2*cos(80*pi*t2);%c2 signal
tf2=fftshift(fft(c2));%rearranges a Fourier transform by shifting the zero-frequency component to the center of the c2
f2 = -fs2/2:fs2/(length(tf2)-1):fs2/2 ;%frequency domain
plot(f,abs(tf2))
xlabel('Frequency(HZ)')
ylabel('Magnitude')
title('C2(f)')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-d-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
syms t
%y1=x1.c1
y1 = (2*heaviside(t-1)-2*heaviside(t-3)).*(4*cos(120*pi*t));
Fy1=fourier(y1);
fprintf('y1 = ');
disp(y1);
fprintf('Fourier Tranform of y1 = ');
disp(Fy1);
% 
%y2=x2*c2
x2=9.*(t-11/3).*heaviside(t-11/3)-18.*(t-4).*heaviside(t-4)+9.*(t-13/3).*heaviside(t-13/3);
c2=2*cos(80*pi*t);
y2 = x2*c2;
Fy2 = fourier(y2);
fprintf('\ny2 = ');
disp(y2);
fprintf('Fourier Tranform of y2 = ');
disp(Fy2);

%v= y1+y2
v= y1+y2;
Fv=fourier(v);
fprintf('\nV = ');
disp(v);
fprintf('Fourier Tranform of V = ');
disp(Fv);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-e-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%fourier transform Plot of Y1
figure
fs2=200;%sampling frequency
ts2=1/fs2;%f=1/t
t2 = 0:ts2:20;%time range 
Y1 =((2*heaviside(t2-1)-2*heaviside(t2-3)).*(4*cos(120*pi*t2)));%y1= x1*c1
x= fftshift(fft(Y1)); 
n = length(x); 
fshift= -fs2/2:fs2/(n-1):fs2/2; 
plot(fshift,abs(x));
xlabel('Frequency(HZ)')
ylabel('Magnitude')
title('Y1(f)')
 
%%%%fourier transform Plot of Y2
figure
fs2=100;%sampling frequency
ts2=1/fs2;%f=1/t
t2 = 0:ts2:20;%time range 
Y2 =(9.*(t2-11/3).*heaviside(t2-11/3)-18.*(t2-4).*heaviside(t2-4)+9.*(t2-13/3).*heaviside(t2-13/3)).*(2*cos(80*pi*t2));;%y1= x1*c1
x= fftshift(fft(Y2)); 
n = length(x); 
fshift= -fs2/2:fs2/(n-1):fs2/2; 
plot(fshift,abs(x));
xlabel('Frequency(HZ)')
ylabel('Magnitude')
title('Y2(f)')
 

%%%%Plot of fourier transform of v
figure
fs2=150;%sampling frequency
ts2=1/fs2;%f=1/t
t2 = 0:ts2:100;%time range 
Y2 =(9.*(t2-11/3).*heaviside(t2-11/3)-18.*(t2-4).*heaviside(t2-4)+9.*(t2-13/3).*heaviside(t2-13/3)).*(2*cos(80*pi*t2));;%y1= x1*c1
Y1 =((2*heaviside(t2-1)-2*heaviside(t2-3)).*(4*cos(120*pi*t2)));%y1= x1*c1
V= Y1+Y2;
x= fftshift(fft(V )); 
n = length(x); 
fshift= -fs2/2:fs2/(n-1):fs2/2; 
plot(fshift,abs(x));
xlabel('Frequency(HZ)')
ylabel('Magnitude')
title('V(f)')
 






