function drawFigure(xx, method, res )
%DRAWFIGURE Summary of this function goes here
%   Detailed explanation goes here
%cc=hsv(length(method));
%cc=jet(length(method));

%cc=varycolor(length(method));
cc = distinguishable_colors(length(method));
h = figure('Position', [200 200 450 400]);
markers = {'+','o','*','.','x','s','d','^','v','>','<','p','h'};

for i = 1:length(method)
    semilogx(xx, res(i,:), 'color', cc(i,:), 'LineWidth',1.3, 'marker', markers{i});
    hold on;
end
ylabel('Precision');
xlabel('Number of bits in binary codes');
ylim([0 1]);
xlim([min(xx) max(xx)]);
set(gca, 'XTick', xx)
grid on;
legend(method, 'location', 'SouthEast');
%print(h, sprintf('figure_%f.eps', now), '-depsc')

end