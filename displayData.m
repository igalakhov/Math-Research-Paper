clear
load "1000_data.mat"

includeBubble = false;

%collect data 
averageData = [];
for i = 1:1000
  averageData = [averageData; mean(algorithmData(:, :, i))];
  end

%generate an x axis lable 
xLbl = (0:999)/999;
disp(averageData(2, :));
for i = 1:5
  curColumn = averageData(:, i);
  switch (i)
    case 1
      if includeBubble
        %h = plot(xLbl, curColumn, 'b');
      end
    case 2
      %h = plot(xLbl, curColumn, 'r');
    case 3
      %%h = plot(xLbl, curColumn, 'g');
    case 4
      h = plot(xLbl, curColumn, 'k');
    case 5
      %h = plot(xLbl, curColumn, 'm');
    end
  if(!includeBubble && i != 1)
    if(includeBubble)
      %set(h(1),'linewidth', 2);
    else 
      %set(h(1), 'linewidth', 1);
     end
    end
  hold on;
  end

%make graph look good
set(gcf, 'renderer', 'opengl');
if includeBubble
  legend("bubble", "selection", "insertion", "merge", "quick", 'location', 'bestoutside');
else 
  %legend("selection", "insertion", "merge", "quick", 'location', 'bestoutside');
  legend("merge");
end 

xlim([0 1]);
if includeBubble
  ylim([0 (6 * 10 ^ 6)]);
else 
  ylim([0 (0.05 * 10 ^ 6)]);
end

title("Number of inversions vs number of steps");
xlabel("Number of inversions (scaled from 0 to 1)");
ylabel("Number of steps");
print -dpng mergeSortOnly.png
