% IMPORTANT: Make sure you run setup_rotpen.m first. You need the (A,B)
% state-space matrices.
%
%% Find Tranformation Matrix W
% Characteristic equation: s^4 + a_4*s^3 + a_3*s^2 + a_2*s + a_1
a = poly(A)
% 
% Companion matrices (Ac, Bc)
Ac = [  0 1 0 0;
        0 0 1 0;
        0 0 0 1;
        -a(5) -a(4) -a(3) -a(2)]
%
Bc = [0; 0; 0; 1]
%
% Controllability
T = ctrb(A,B);
%rank(T);
% Controllability of companion matrices
Tc = ctrb(Ac,Bc);
% Transformation matrices
W = T*inv(Tc)
%
%% Find Gain
% Companion state-feedback control gain
sigma = zeta*wn;
wd = wn*sqrt(1-zeta^2);
p1 = -sigma + i*wd;
p2 = -sigma - i*wd;
p3 = -30;
p4 = -40;
P_d = [p1 p2 p3 p4]

CE_d= poly(P_d);
Kc = [-a(5)+CE_d(5) -a(4)+CE_d(4) -a(3)+CE_d(3) -a(2)+CE_d(2)]
% Convert back from companion form
K = Kc*inv(W)
%
%% Closed-loop System Poles
% Find poles of closed-loop system. 
% Verify that they are the same as the desired poles.
cls_poles = eig(A-B*K)
