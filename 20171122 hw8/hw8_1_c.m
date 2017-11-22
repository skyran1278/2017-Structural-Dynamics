clc; clear; close all;

m = 100; % kg
wn = 0.5; % Hz
kxi = 0.03;

c = 2 * wn * kxi * m;
k = m * wn ^ 2;

Hup = tf(1, [m, c, k])

Hudotp = tf([1 0], [m c k])

impulse(Hup);
