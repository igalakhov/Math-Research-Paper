clear
load "1000_data.mat"
format long g

includeBubble = false;

%collect data 
y = [];
for i = 1:1000
  y = [y; mean(algorithmData(:, :, i))];
  end

%generate an x axis label 
x = ((1:1000)/999)';
y = y((1:1000), 5);
disp(min(y));
fit = (polyfit(x, y, 100));
disp(fit);

x1 = linspace(0,1);
y1 = polyval(fit,x1);
figure
plot(x,y,'o')
hold on
plot(x1,y1)
ylim([0 (1 * 10 ^ 6)]);
xlim([0 1]);
hold off

