clc;
clear;
close all;
% 1. Sine / Cosine Signal
t = 0:0.001:1;
f=5;
x1 = cos(2*pi*f*t);
x2 = sin(2*pi*f*t);
figure;
plot(t,x1,'r',t,x2,'b');
xlabel('Time');
ylabel('Amplitude');
title('Sine and Cosine Signal');
legend('Cosine','Sine');

% 2. Sinc Function

t1= -1:0.001:1
x3 = sin(pi*t1)./(pi*t1);
x3(t1==0) = 1;
figure;
plot(t1,x3);
xlabel('Time');
ylabel('Amplitude');
title('Sinc Function');

% 3. Triangular Waveform

t2= -2*pi:0.01:2*pi;
x4 = 2*abs(2*(t2/(2*pi) - floor(0.5+ t2/(2*pi)))) - 1;
figure;
plot(t2,x4);
xlabel('Time');
ylabel ('Amplitude');
title('Triangular Waveform');

% 4. Rectangular Pulse

t3=-2:0.001:2;
x5 = double(abs(t3) <= 0.5);
figure;
plot(t3,x5);
xlabel('Time');
ylabel('Amplitude');
title('Rectangular Pulse');

% 5. Sawtooth Waveform

t4=-2*pi:0.01:2*pi;
x6 = 2*(t4/(2*pi) - floor(0.5 + t4/(2*pi)));
figure;
plot(t4,x6);
xlabel('Time');
ylabel('amplitude');
title('Sawtooth Waveform');
legend('Sawtooth');
grid on;