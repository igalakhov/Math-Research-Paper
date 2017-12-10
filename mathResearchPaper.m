%{
Ivan Galakhov
Math research paper
The effect of number of inversion in a list on the runtime complexity of various
  sorting algorithms. 
%}
%{
numtrials = 55;
trialsPer = 1;
arrSize = 100;
quickSortVals = [];
insertionVals = [];
selectionVals = [];
for i = 0:numtrials - 1
  tempQuickVals = [];
  tempInsertionVals = [];
  tempSelectionVals = [];
  for j = 1:trialsPer 
    tempList = randomListWithNInversions(arrSize, (arrSize*arrSize/2)*(i)/(numtrials));
    [dummy numQuick] = quicksort(tempList);
    [dummy numIns] = insertionSort(tempList);
    [dummy numSelec] = selectionSort(tempList);
    tempQuickVals = [tempQuickVals numQuick];
    tempInsertionVals = [tempInsertionVals numIns];
    tempSelectionVals = [tempSelectionVals numSelec];
  end
  quickSortVals = [quickSortVals mean(tempQuickVals)];
  insertionVals = [insertionVals mean(tempInsertionVals)];
  selectionVals = [selectionVals mean(tempSelectionVals)];
end
xLable = (0:numtrials - 1)/numtrials;
plot(xLable, quickSortVals);
hold on;
plot(xLable, insertionVals);
hold on;
plot(xLable, selectionVals);
%}
quicksort(randomListWithNInversions(100, 100*100/8));