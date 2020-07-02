s = 60; v = 120; f = 30;
t1 = t2 = 1;

a10 = s;
a11 = 0;
a12 = (12*v-3*f-9*s)/(4*t1.^2);
a13 = (-8*v+3*f+5*s)/(4*t1.^3);

a20 = v;
a21 = (3*f-3*s)/(4*f);
a22 = (-12*v+6*f+6*s)/(4*t2.^2);
a23 = (8*v-5*f-3*s)/(4*t2.^3);

function [angle, v, a, k] = solve(time, a0, a1, a2,a3)
    k = a3.*ones(size(time));
    a = a2 + time.*k;
    v = a1 + time.*a;
    angle = a0 + time.*v;
end

function output = plot_results(time_intervals, angle, v, a, k)
    figure
    subplot(4,1,1);plot(time_intervals,angle);title('Angle');
    subplot(4,1,2);plot(time_intervals,v);title('Velocity');
    subplot(4,1,3);plot(time_intervals,a);title('Accelaration');
    subplot(4,1,4);plot(time_intervals,k);title('K');
    saveas(gcf,'results_c.png');
end