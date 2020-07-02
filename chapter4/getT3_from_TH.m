function T_0_3 = getT3_from_TH(TH)
    R = TH(1:3,1:3);
    P_3_H = [2; 0; 0];
    P_0_H = TH(1:3, 4);
    P_0_3 = P_0_H - R*P_3_H;
    T_0_3 = R;
    T_0_3(1:3, 4) = P_0_3;
end

