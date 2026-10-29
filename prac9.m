clc;
clear all;
close all;
syms x
X = sin(x);
f= ztrans(X);
disp('Z-transform of sin(x):');
pretty(f);

inverseTransform = iztrans(f);
disp('Inverse Z-transform:');
pretty(inverseTransform);

sys = tf([1],[1 2 1]);
pzplot(sys);
grid on;