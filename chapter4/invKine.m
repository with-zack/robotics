function angles = invKine(T3)
    angles = -ones(1, 4);
    l1 = 4; l2 = 3;
    phi = atan2(T3(2, 1), T3(1,1));
    x = T3(1, 4); y = T3(2, 4);
    c2 = (x^2 + y^2 - l1^2 - l2^2)/(2*l1*l2);
    if c2 < -1 || 1 < c2
        return
    end
    s2 = [sqrt(1-c2^2), -sqrt(1-c2^2)];
    k1 = l1 + l2*c2;
    k2 = l2.*s2; % 
    r = sqrt(k1^2 + k2.^2);
    theta1 = atan2(y, x) - atan2(k2, k1);
    theta2 = atan2(s2, c2);
    theta3 = phi - theta1 -theta2;
    angles = [theta1; theta2; theta3];
end