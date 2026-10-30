% Assigned signal: x(t) = t^2 * rect(t/4)
clc;
clear;
close all;

%% 1. Original signal
 t = -5:0.01:5;
 xfun = @(t) t.^2 .* (abs(t) <= 2); % rect(t/4) is 1 inside -2 to 2
 x = xfun(t);

 
%% 2. Time-domain transformations
 a = input('Enter time shift a (example 1): ');
 b = input('Enter time scale b (non-zero, example 2): ');
 if isempty(a), a = 1; end
 if isempty(b) || b == 0
     b = 2;
     disp('Scale cannot be zero. Using b = 2.');
 end
 x_shift = xfun(t-a);  
 x_scale = xfun(b*t);  
 x_reflect = xfun(-t); 

%% 3. Range / amplitude transformations
 x_clip = min(max(x,-1),1); 
 x_rectify = max(x,0);      
 x_square = x.^2;           
 x_absolute = abs(x);      

%% 4. Plot original signal and all transformations
 figure('Name','A11 Signal Transformations');
 subplot(3,3,1);
 plot(t,x); 
 grid on; 
 title('Original x(t)');

 subplot(3,3,2);
 plot(t,x_shift);
 grid on;
 title('Shift x(t-a)');
 
 
 subplot(3,3,3);
 plot(t,x_scale);
 grid on; 
 title('Scale x(bt)');
 
 subplot(3,3,4);
 plot(t,x_reflect);
 grid on; 
 title('Reflection x(-t)');
 
 subplot(3,3,5);
 plot(t,x_clip); 
 grid on;
 title('Clipping [-1,1]');
 
 subplot(3,3,6);
 plot(t,x_rectify);
 grid on;
 title('Half-wave rectification');
 
 subplot(3,3,7);
 plot(t,x_square);
 grid on;
 title('Squaring x(t)^2');

 subplot(3,3,8);
 plot(t,x_absolute); 
 grid on;
 title('Absolute value |x(t)|');
 
 subplot(3,3,9);
 axis off;
 text(0,0.7,'x(t) = t^2 rect(t/4)');
 text(0,0.4,'Time operations change time.');
 text(0,0.1,'Range operations change amplitude.');

%% 5. Composition Explorer: three examples where f(g(t)) is not g(f(t))
z = -2:0.01:2;

% Example 1: f(z)=z+1, g(z)=z^2
fg1 = z.^2 + 1;
gf1 = (z+1).^2;

% Example 2: f(z)=2z, g(z)=z+3
fg2 = 2*(z+3);
gf2 = 2*z + 3;

% Example 3: f(z)=abs(z), g(z)=z-1
fg3 = abs(z-1);
gf3 = abs(z)-1;

figure('Name','Composition Examples: Not Equal');
subplot(3,1,1);
plot(z,fg1,z,gf1,'--');
grid on;
title('Example 1: f(g(t)) is not g(f(t))');
legend('f(g(t))','g(f(t))');

subplot(3,1,2);
plot(z,fg2,z,gf2,'--'); 
grid on;
title('Example 2: f(g(t)) is not g(f(t))'); 
legend('f(g(t))','g(f(t))');

subplot(3,1,3);
plot(z,fg3,z,gf3,'--'); 
grid on;
title('Example 3: f(g(t)) is not g(f(t))');
legend('f(g(t))','g(f(t))');

%% 6. Composition examples where f(g(t)) equals g(f(t))
% Example A: f(z)=z+2 and g(z)=z+3, both give z+5
fgA = (z+3)+2;
gfA = (z+2)+3;

% Example B: f(z)=2z and g(z)=3z, both give 6z
fgB = 2*(3*z);
gfB = 3*(2*z);

figure('Name','Composition Examples: Equal');
subplot(2,1,1);
plot(z,fgA,z,gfA,'--');
grid on;
title('Equal example A: f(g(t)) = g(f(t))'); 
legend('f(g(t))','g(f(t))');

subplot(2,1,2);
plot(z,fgB,z,gfB,'--'); 
grid on;
title('Equal example B: f(g(t)) = g(f(t))');
legend('f(g(t))','g(f(t))');

