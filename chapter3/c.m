pkg load symbolic
syms c1 c2 c3 s1 s2 s3

T0_1 = [[c1, -s1, 0, 0];
        [s1,  c1, 0, 0];
        [0,   0,  1, 0];
        [0,   0,  0, 1]];

T1_2 = [[c2, -s2, 0, 4];
        [s2,  c2, 0, 0];
        [0,   0,  1, 0];
        [0,   0,  0, 1]];

T2_3 = [[c3, -s3, 0, 3];
        [s3,  c3, 0, 0];
        [0,   0,  1, 0];
        [0,   0,  0, 1]];

T3_H = [1,   0,  0, 2;
        0,   1,  0, 0;
        0,   0,  1, 0;
        0,   0,  0, 1];

T0_3 = T0_1*T1_2*T2_3;
T0_H = T0_3*T3_H;

test_values = [[0, 0, 0]; [10, 20, 30]; [90, 90, 90]];

T = function_handle(T0_3);
TH = function_handle(T0_H);
% function [co1, co2, co3,si1, si2, si3] = get_syms(the1, the2, the3)
%     co1 = cos(the1);
%     co2 = cos(the2);
%     co3 = cos(the3);
%     si1 = sin(the1);
%     si2 = sin(the2);
%     si3 = sin(the3);
% end
T(cos(0), cos(0), cos(0), sin(0), sin(0), sin(0));
T(cos(10), cos(20), cos(30), sin(10), sin(20), sin(30));
T(cos(30), cos(60), cos(90), sin(30), sin(60), sin(90));
TH(cos(0), cos(0), cos(0), sin(0), sin(0), sin(0));
TH(cos(10), cos(20), cos(30), sin(10), sin(20), sin(30));
TH(cos(30), cos(60), cos(90), sin(30), sin(60), sin(90));
T(cos(0), cos(0), cos(0.5*pi), sin(0), sin(0), sin(0.5*pi))
TH(cos(0), cos(0), cos(0.5*pi), sin(0), sin(0), sin(0.5*pi))