clc;
clear all;
close all;
T = 2*pi;
t=linspace(0,4*pi,1000);
N=50;

sq_wave=zeros(size(t));

omega=2*pi/T;
for n=1:N
    if mod(n,2)==1
        sq_wave=sq_wave+(4/(n*pi))*sin(n*omega*t);

    end       

end

plot(t,sq_wave);
grid on;
xlabel('Time(t)');
ylabel('Amplitude');
title('Fourier Series Approximation of a Square Wave');

subplot(3,1,1);
plot(t,sq_wave);
grid on;
xlabel('Time(t)');
ylabel('Amplitude');
title('Fourier Series Approximation of a Square Wave');

%2 st_wave
st_wave=zeros(size(t));
st_wave = st_wave + (2 / (n* pi)) * ((-1)^(n+1))* sin(n* omega* t);
plot(t,st_wave);
grid on;
xlabel('Time(t)');
ylabel('Amplitude');
title('Fourier Series Approximation of a Sawtooth Wave');
subplot(3,1,2);
plot(t,sq_wave);
grid on;
xlabel('Time(t)');
ylabel('Amplitude');

% 3 triangular wave
tr_wave = zeros(size(t));
for n = 1:2:(2*N-1)
    tr_wave = tr_wave + (8/pi^2) * ((-1)^((n-1)/2) / n^2) * sin(n*omega*t);
end

subplot(3,1,3);
plot(t,tr_wave);
grid on;
xlabel('Time(t)');
ylabel('Amplitude');
title('Fourier Series Approximation of a Triangular Wave');
