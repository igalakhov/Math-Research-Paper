%{
Ivan Galakhov
Math research paper
The effect of number of inversion in a list on the runtime complexity of various
  sorting algorithms. 
%}

numtrials = 45;
trialsPer = 1;
arrSize = 100;
quickSortVals = [];
insertionVals = [];
selectionVals = [];
bubbleVals = [];
mergeVals = [];
for i = 0:numtrials - 1
  tempQuickVals = [];
  tempInsertionVals = [];
  tempSelectionVals = [];
  tempBubbleVals = [];
  tempMergeVals = [];
  for j = 1:trialsPer 
    disp("trial");
    disp(i);
    disp("iteration");
    disp(j);
    tempList = randomListWithNInversions(arrSize, (arrSize*arrSize/2)*(i)/(numtrials));
    [dummy numQuick] = quicksort(tempList);
    [dummy numIns] = insertionSort(tempList);
    [dummy numSelec] = selectionSort(tempList);
    [dummy numBubble] = bubbleSort(tempList);
    [dummy numMerge] = mergeSort(tempList);
    
    tempQuickVals = [tempQuickVals numQuick];
    tempInsertionVals = [tempInsertionVals numIns];
    tempSelectionVals = [tempSelectionVals numSelec];
    tempBubbleVals = [tempBubbleVals numBubble];
    tempMergeVals = [tempMergeVals numMerge];
  end

  quickSortVals = [quickSortVals mean(tempQuickVals)];
  insertionVals = [insertionVals mean(tempInsertionVals)];
  selectionVals = [selectionVals mean(tempSelectionVals)];
  bubbleVals = [bubbleVals mean(tempBubbleVals)];
  mergeVals = [mergeVals mean(tempMergeVals)];
end
xLable = (0:numtrials - 1)/numtrials;
plot(xLable, quickSortVals);
hold on;
plot(xLable, insertionVals);
hold on;
plot(xLable, selectionVals);
hold on;
plot(xLable, bubbleVals);
hold on;
plot(xLable, mergeVals);