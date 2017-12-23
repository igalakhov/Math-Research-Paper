clear
more off
load inversionMatrixes1000.mat

startTime = time();
algorithmData = zeros(numPerInterval, 5, numIntervals);
disp(strcat(sprintf("Beginning generation of data for list size %d | timestamp: ", listSize), strftime (" %H:%M:%S %m-%d", localtime(time()))));
for blockNum = 1:numIntervals
  curBlockOut = [];
  curBlockData = inversionMatrix(:, :, blockNum);
  disp(strcat(sprintf("Starting block %d | timestamp: ", blockNum), strftime (" %H:%M:%S %m-%d", localtime(time()))));
  disp("---------------------");
  for curListNum = 1:numPerInterval
    disp(sprintf("Starting List %d of block %d", curListNum, blockNum));
    
    curList = curBlockData(curListNum, :);
    tic;
    disp("starting BubbleSort");
    [dummy bubbleData] = bubbleSort(curList);
    toc;
    tic;
    disp("starting selectionSort");
    [dummy selectionData] = selectionSort(curList);
    toc;
    tic;
    disp("starting insertionSort");
    [dummy insertionData] = insertionSort(curList);
    toc;
    tic;
    disp("starting mergeSort");
    [dummy mergeData] = mergeSort(curList);
    toc;
    tic;
    disp("starting quickSort");
    [dummy quickData] = quickSort(curList);
    toc;
    disp("---");
    
    %collect data in array
    curListData = [bubbleData selectionData insertionData mergeData quickData];
    curBlockOut = [curBlockOut; curListData];
  end 
  %store data
  algorithmData(:, :, blockNum) = curBlockOut;
  save "-v6" "1000_data.mat" algorithmData
  end
save "-v6" "1000_data.mat" algorithmData
disp(sprintf("Finished! Entire process took %0.2f seconds", time() - startTime));
  