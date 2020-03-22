clear all;
function T_0_3 = getT3_from_TH(TH)
    R = TH(1:3,1:3);
    P_3_H = [2; 0; 0];
    P_0_H = TH(1:3, 4);
    P_0_3 = P_0_H - R*P_3_H;
    T_0_3 = R;
    T_0_3(1:3, 4) = P_0_3;
end

TH1 = [ 1, 0, 0, 9;
        0, 1, 0, 0;
        0, 0, 1, 0;
        0, 0, 0, 1];
TH2 = [ 0.5, -0.866, 0, 7.5373;
        0.866, 0.5, 0, 3.9266;
        0, 0, 1, 0;
        0, 0, 0, 1];
TH3 = [ 0, 1, 0, -3;
        -1, 0, 0, 2;
        0, 0, 1, 0;
        0, 0, 0, 1];
TH4 = [ 0.866, -0.5, 0, -3.1245;
        0.5, 0.866, 0, 8.1674;
        0, 0, 1, 0;
        0, 0, 0, 1];

function angles = invKine(T3)
    angles = -ones(1, 4);
    l1 = 4; l2 = 3;
    phi = atan2(T3(2, 1), T3(1,1));
    x = T3(1, 4); y = T3(2, 4);
    c2 = (x**2 + y**2 - l1**2 - l2**2)/(2*l1*l2);
    if c2 < -1 || 1 < c2
        return
    end
    s2 = [sqrt(1-c2**2), -sqrt(1-c2**2)];
    k1 = l1 + l2*c2;
    k2 = l2.*s2; % 
    r = sqrt(k1**2 + k2.^2);
    theta1 = atan2(y, x) - atan2(k2, k1);
    theta2 = atan2(s2, c2);
    theta3 = phi - theta1 -theta2;
    angles = [theta1; theta2; theta3];
end

invKine(getT3_from_TH(TH1))*180/pi
invKine(getT3_from_TH(TH2))*180/pi
invKine(getT3_from_TH(TH3))*180/pi
invKine(getT3_from_TH(TH4))*180/pi