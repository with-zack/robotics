% see $7.3 for details
s = 120; f = 60; t = 1;
a0 = s;
a1 = 0;
a2 = 3*(f-s)/(t.^2);
a3 = -2*(f-s)/(t.^3);
x = 0:0.05:1;
[angle, v, acce, k] = solve(x, a0, a1, a2,a3);
plot_results(x, angle, v, acce, k);
function [angle, v, a, k] = solve(time, a0, a1, a2,a3)
    k = 2+6.*a3.*ones(size(time));
    a = 2.*a2 + 6.*a3.*time;
    v = a1 + 2.*time.*a2 + 3.*a3.*(time.^2);
    angle = a0 + a1.*time+a2.*(time.^2) + a3.*(time.^3);
end

function plot_results(time_intervals, angle, v, a, k)
    figure
    subplot(4,1,1);plot(time_intervals,angle);title('Angle');
    subplot(4,1,2);plot(time_intervals,v);title('Velocity');
    subplot(4,1,3);plot(time_intervals,a);title('Accelaration');
    subplot(4,1,4);plot(time_intervals,k);title('K');
    saveas(gcf,'./results_a.png');
end

