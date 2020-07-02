s = 120; f = 60; t = 1;

a0 = s;
a1 = 0;
a2 = 0;
a3 = (20*f-20*s)/(2*t.^3);
a4 = (30*s-30*f)/(2*t.^4);
a5 = (12*f-12*s)/(2*t.^5);
x = [0:0.05:1];
[angle, v, a, k] = solve(x, a0, a1, a2, a3, a4, a5);
plot_results(x, angle, v, a, k);


function [angle, v, a, k] = solve(time, a0, a1, a2,a3, a4, a5)
    k = a3 + time.*(a4 + time.*a5);
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
    saveas(gcf,'results_b.png');
end