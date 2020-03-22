% 使用三次多项式进行路径规划
% 起始点和终止点的角速度为0
s = 120; f = 60; t = 1;

a0 = s;
a1 = 0;
a2 = 3*(f-s)/(t**2);
a3 = -2*(f-s)/(t**3);

function [angle, v, a, k] = solve(time, a0, a1, a2,a3)
    k = a3.*ones(size(time));
    a = a2 + time.*k;
    v = a1 + time.*a;
    angle = a0 + time.*v;
end

% for index = 1:10
%     fprintf("time: %f theta: %f\n", index/10, theta(index/10, a0, a1, a2, a3));
% end


function output = plot_results(time_intervals, angle, v, a, k)
    figure
    subplot(4,1,1);plot(time_intervals,angle);title('Angle');
    subplot(4,1,2);plot(time_intervals,v);title('Velocity');
    subplot(4,1,3);plot(time_intervals,a);title('Accelaration');
    subplot(4,1,4);plot(time_intervals,k);title('K');
    saveas(gcf,'results_a.png');
end


x = [0:0.1:1];
[angle, v, a, k] = solve(x, a0, a1, a2,a3);
plot_results(x, angle, v, a, k);