%{
  Selection Sort!
%}

function [sorted numSteps] = selectionSort(listIn)
  sorted = [];
  numSteps = 0;
  for i = (1 : (length(listIn)))
    curSmallest = 10 ^ 10;
    curSmallestIndex = i;
    for j = (i : (length(listIn)))
      curElement = listIn(j); 
      numSteps += 1; 
      if(curElement < curSmallest)
       curSmallest = curElement;
       curSmallestIndex = j;
       end
      numSteps += 1;
      end
      listIn = swap(curSmallestIndex, i, listIn);
    end
    
 
  
  
  function [list] = swap(idx1, idx2, list)
    temp = list(idx1);
    list(idx1) = list(idx2);
    list(idx2) = temp;
    numSteps += 4;
    end
     
  end