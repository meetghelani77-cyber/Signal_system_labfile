clc;
clear all;
close all;
%1 linearity
x1 = [1,0,-1,2];
x2 = [-2,3,2,-3];

a = input('enter the value of a');
b = input('enter the value of b');

y1 = exp(a*x1);
y2 = exp(b*x2);

y11 = y1+ y2
y12 = exp(a*x1 + b*x2);
subplot(2,2,1);
stem(x1);
subplot(2,2,2);
stem(x2);
subplot(2,2,3);
stem(y11);
subplot(2,2,4);
stem(y12);

if(abs(y11-y12)<=0.001) then disp("the system is linear");
else
    disp("the system is non linear"); 
end;

%2 time invarient
x = [1,0,-1,2];
x1 = [x zeros(1,10)];
k = input("enter the shift value");
x11 = [zeros(1,k) x1];
y11 = exp(x11);
y12 = exp(x1);
y12_new = [zeros(1,k) y12];
subplot(2,2,1);
stem(x1);
subplot(2,2,2);
stem(x11);
subplot(2,2,3);
stem(y11);
subplot(2,2,4);
stem(y12_new); 
if(abs(y11-y12_new)<=0.001)
then
    disp("the system is time invariant"); 
else
    disp("the system is time variant");
end;

%3 stability
x = sin(0:0.01:2*pi);
y = exp(x);

if isbounded(x) && isbounded(y)
    disp("the system is stable");
else
    disp("the system is unstable");
end

function result = isbounded(signal)
    result = all(isfinite(signal)) && max(abs(signal)) < Inf;
end

