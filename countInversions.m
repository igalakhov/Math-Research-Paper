%{
 This function takes two lists and uses a modified version of mergesort to count
 how many inversions the list has. This works because mergesort begins sorting
 lists on the lists lowest levels and gradually moves up as the list becomes 
 more and more sorted. When merging two lists, every time we switch the places 
 of two elements, we can count this as an inversion. 
%}

function [outList numInversions] = countInversions(listIn, curInversions)
  if((length(listIn) == 1) || (length(listIn) == 2))
    outList = listIn;
    numInversions = 0;
  else 
    [half1 half1Inversions] = countInversions(listIn(1:(floor(length(listIn)/2))), 0);
    [half2 half2Inversions] = countInversions(listIn((1 + floor(length(listIn)/2)): end), 0);
    [outList newInversions] = mergeAndCountInversions(half1, half2);
    numInversions = curInversions + newInversions;
    end
  end
  
function [sorted numInversions] = mergeAndCountInversions(list1, list2)
  numInversions = 0;
  sorted = [];
  while (length(list1) > 0 && length(list2) > 0)
    if (list2(1) > list1(1))
      sorted = [sorted list1(1)];
      list1 = list1(2 : end);
    else 
      numInversions += 1;
      sorted = [sorted list2(1)]; 
      list2 = list2(2 : end);
      end
    end
    
    if (length(list1) == 0)
      sorted = [sorted list2];  
    elseif (length(list2) == 0)
      sorted = [sorted list1];
    end
    
    combinedOut = [numInversions sorted];
  end