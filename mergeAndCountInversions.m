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