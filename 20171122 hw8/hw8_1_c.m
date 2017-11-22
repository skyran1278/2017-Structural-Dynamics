clc; clear; close all;

m = 100; % kg
wn = 0.5; % Hz
kxi = 0.03;

c = 2 * wn * kxi * m;
k = m * wn ^ 2;


%------------------
% (c)
%------------------
Hup = tf(1, [m, c, k]);

Hvp = tf([1 0], [m c k]);


%------------------
% (d)
%------------------
wd = wn * sqrt(1 - kxi ^ 2);
t = 0 : 0.001 : 400;
h = 1 / (m .* wd) .* exp(- kxi .* wn .* t) .* sin(wd .* t);

figure;
plot(t, h);
title('Impulse response function');
xlabel('Time(seconds)');
ylabel('Amplitude');


%------------------
% (e)
%------------------
figure;
impulse(Hup);


%------------------
% (g)
%------------------
p0 = 10; % p(t) = p0, where p0 = 10 N
u_tm = p0 * step(Hup);
v_tm = p0 * step(Hvp);


%------------------
% (j)
%------------------
