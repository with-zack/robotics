s = 60; v = 120; f = 30;
tv = 1;
tf = 2;

syms a0 a1 a2 a3 b0 b1 b2 b3
[a0, a1, a2, a3, b0, b1, b2, b3] = solve(a0==s, b0+b1*tf+b2*tf^2+b3*tf^3==f, ...
  a0+a1*tv+a2*tv^2+a3*tv^3==v, b0+b1*tv+b2*tv^2+b3*tv^3==v,...
  a1+2*a2*tv+3*a3*tv^2==b1+2*b2*tv+3*a3*tv^2, 2*a2+6*a3*tv==2*b2+6*b3*tv,...
  a1==0, b1+2*b2*tf+3*b3*tf^2==0);

[angle, v, a, k] = getValues(double(a0), double(a1), double(a2), double(a3),...
                     double(b0), double(b1), double(b2), double(b3));
plot_results(angle, v, a, k);
function [angle, v, acce, k] = getValues(a0, a1, a2, a3, b0, b1, b2, b3)
    time = 0:0.001:1;
    k1 = 2+6.*a3.*ones(size(time));
    acce1 = 2.*a2 + 6.*a3.*time;
    v1 = a1 + 2.*time.*a2 + 3.*a3.*(time.^2);
    angle1 = a0 + a1.*time+a2.*(time.^2) + a3.*(time.^3);
    time = 1.001:0.001:2;
    k2 = 2+6.*b3.*ones(size(time));
    acce2 = 2.*b2 + 6.*b3.*time;
    v2 = b1 + 2.*time.*b2 + 3.*b3.*(time.^2);
    angle2 = b0 + b1.*time+b2.*(time.^2) + b3.*(time.^3);
    angle = [angle1 angle2];
    v = [v1 v2];
    acce = [acce1 acce2];
    k = [k1 k2];
end

function plot_results(angle, v, a, k)
    time_intervals = 0:0.001:2;
    figure
    subplot(4,1,1);plot(time_intervals,angle);title('Angle');
    subplot(4,1,2);plot(time_intervals,v);title('Velocity');
    subplot(4,1,3);plot(time_intervals,a);title('Accelaration');
    subplot(4,1,4);plot(time_intervals,k);title('K');
    saveas(gcf,'results_c.png');
end