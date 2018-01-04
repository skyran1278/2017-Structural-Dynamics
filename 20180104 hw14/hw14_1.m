% M = diag([2.5 2.5 2.5 2.5 2.5 2.5]);
syms w;

M = 2.5 * eye(6);
KPart = [-3200 -3200 -2400 -2000 -1600];
K = diag([6200, 6400, 5600, 4400, 3600, 1600]) + diag(KPart, 1) + diag(KPart, -1);

solve(det(K - w ^ 2 * M))