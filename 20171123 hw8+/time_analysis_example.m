clc; clear; close all;

%------------------
% Parameters
%------------------
wn = (2 * pi) * 1; % natural frequency = 1 Hz or Tn = 1 sec
dmp = 0.02; % damping ratio = 2 %

%------------------
% Load input ground motion
%------------------
load ELC_input % "tt_acc" will show up in Workspace.
% The first column in tt_acc is the time vector
% The second column in tt_acc is the ground acceleration in m/sec^2
dt = tt_acc(2,1)-tt_acc(1,1);

%------------------
% Form ABCD
%------------------
Ac = [0 1;-wn.^2 -2*dmp.*wn];
Bc = [0; -1];
Cc = [1 0;[-wn.^2 -2*dmp.*wn]]; % displacement and abs. acceleration
Dc = [0;0];
%==
sys_sdof = ss(Ac,Bc,Cc,Dc);

%------------------
% Run Simulink
%------------------
sim('eq_analysis',[0 100]);

%------------------
% Plot
%------------------
figure();
set(gcf,'position',[50 50 800 600]);
subplot(2,1,1);
plot(tt,y(:,1));
xlabel('time (sec)','fontsize',14);
ylabel('displacement (m)','fontsize',14);
subplot(2,1,2);
plot(tt,y(:,2)/9.81); % convert it to "g"
xlabel('time (sec)','fontsize',14);
ylabel('abs. acceleration (g)','fontsize',14);
