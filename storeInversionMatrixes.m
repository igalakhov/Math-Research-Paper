%{
  This program generates and stores inversion matrixes
%}
% knobs
more off
listSize = 10; %the size of the list that we are generating
numIntervals = 45; %the number of intervals of inversions that we are doing (or data points on x axis)
numPerInterval = 10; %how many lists we will generate per each interval

%the number of inversions
inversionNums = int32(((0:(numIntervals - 1))/(numIntervals - 1)) * (listSize * ((listSize - 1)/2)));

inversionMatrix = zeros(numPerInterval, listSize, numIntervals);
numDone = 0;
numTotal = numIntervals * numPerInterval;

startTime = time();

for interval = 1:numIntervals
  curNumInversions = inversionNums(interval);
  curGroup = [];
  blockTime = time();
  for curListNum = 1:numPerInterval
    %print timestamp
    numDone += 1;
    %print confirmation message
    disp(strcat(sprintf('Generating list #%d with %d inversions, | timestamp: ', curListNum, curNumInversions), strftime (" %H:%M:%S %m-%d", localtime(time()))));
    %generate list 
    curList = randomListWithNInversions(listSize, curNumInversions);
    curGroup = [curGroup; curList];
    %print another confirmation message
    disp(strcat(sprintf('--> List generated! Aboult %0.2f%% percent done, | timestamp:', (numDone / numTotal) * 100), strftime (" %H:%M:%S %m-%d", localtime(time()))));
  end
  %store and save
  inversionMatrix(:, :, interval) = curGroup;
  curTime = time();
  disp(" ");
  disp(strcat(sprintf('Block Finished in %0.0f seconds! Saving... | timestamp: ', time() - blockTime), strftime (" %H:%M:%S %m-%d", localtime(time()))));
  save "-v6" inversionMatrixes10.mat inversionMatrix listSize numIntervals numPerInterval
  disp(sprintf('Saved after about %0.2f seconds, moving on to next block...', time() - curTime));
  disp(" ");
end

%finally, save everything one last time to be sure :)

save "-v6" inversionMatrixes10.mat inversionMatrix listSize numIntervals numPerInterval

disp(sprintf('Done! Entire process took %0.0f seconds', time() - startTime));

more on
