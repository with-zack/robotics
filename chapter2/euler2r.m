function R = euler2r(alpha, beta, gamma)
% This function calculates Rotation matrix based on angles
% alpha for Z axis, beta for Y, gamma for X
ca = cosd(alpha);
sa = sind(alpha);
cb = cosd(beta);
sb = sind(beta);
cg = cosd(gamma);
sg = sind(gamma);

R = [ca*cb, ca*sb*sg-sa*cg, ca*sb*cg+sa*sg;
     sa*cb, sa*sb*sg+ca*cg, sa*sb*cg-ca*sg;
     -sb, cb*sg, cb*cg];
