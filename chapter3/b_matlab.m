function T = T_from_DH(alpha_i_minus, a_i_minus, d_i, theta_i)
%Get Transform matrix from D-H parameters
%Note this T transform point from i-1 to i
    ct = cos(theta_i);
    st = sin(theta_i);
    ca = cos(alpha_i_minus);
    sa = sin(alpha_i_minus);
    T =[ct,     -st,    0, a_i_minus;
        st*ca,  ct*ca,  -sa, -sa*d_i;
        st*sa,  ct*sa,  ca,     ca*d_i;
        0,  0,  0,  1];
end

T_2_1 = T_from_DH(0, 0, 0, 90)