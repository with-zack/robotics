%pkg load symbolic
syms c1 c2 c3 s1 s2 s3
% create sysmbolic matrix
T0_1 = [[c1, -s1, 0, 0]; [s1,  c1, 0, 0];[0,   0,  1, 0];
        [0,   0,  0, 1]];

T1_2 = [[c2, -s2, 0, 4];[s2,  c2, 0, 0]; [0,   0,  1, 0];
        [0,   0,  0, 1]];

T2_3 = [[c3, -s3, 0, 3]; [s3,  c3, 0, 0]; [0,   0,  1, 0];
        [0,   0,  0, 1]];

T3_H = [1,   0,  0, 2; 0,   1,  0, 0; 0,   0,  1, 0;
        0,   0,  0, 1];

T0_3 = T0_1*T1_2*T2_3
T0_H = T0_3*T3_H;

% subs substitute all syms with the values
% double transform symbolic answer into real values
double(subs(T0_3,  [c1 c2 c3 s1 s2 s3], [cos(0), cos(0), cos(0), sin(0), sin(0), sin(0)]))
double(subs(T0_3,  [c1 c2 c3 s1 s2 s3], [cos(10), cos(20), cos(30), sin(10), sin(20), sin(30)]))
double(subs(T0_3,  [c1 c2 c3 s1 s2 s3], [cos(30), cos(60), cos(90), sin(30), sin(60), sin(90)]))
double(subs(T0_H,  [c1 c2 c3 s1 s2 s3], [cos(0), cos(0), cos(0), sin(0), sin(0), sin(0)]))
double(subs(T0_H,  [c1 c2 c3 s1 s2 s3], [cos(10), cos(20), cos(30), sin(10), sin(20), sin(30)]))
double(subs(T0_H,  [c1 c2 c3 s1 s2 s3], [cos(30), cos(60), cos(90), sin(30), sin(60), sin(90)]))