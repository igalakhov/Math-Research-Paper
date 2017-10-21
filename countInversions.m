%{
 Ill use brute force for now... Ill write it with mergesort Later
 ---
 This function takes two lists and uses a modified version of mergesort to count
 how many inversions the list has. This works because mergesort begins sorting
 lists on the lists lowest levels and gradually moves up as the list becomes 
 more and more sorted. When merging two lists, every time we switch the places 
 of two elements, we can count this as an inversion. 
%}
function [numInversions] = countInversions(listIn)
  numInversions = 0;
  for i = 1:(length(listIn) - 1)
    for j = (i+1):(length(listIn))
      if(listIn(i) > listIn(j))
        numInversions += 1;
      end
    end
end

%{
function [numInversions] = countInversions(inList)
  numInversions = 0;
  function [outList] = mergeSort(toSort)
    if((length(toSort) == 0) || (length(toSort) == 1))
      outList = toSort;
    else
      half1 = mergeSort(toSort(1 : floor(length(toSort)/2)));
      half2 = mergeSort(toSort(floor(length(toSort)/2) + 1 : end));
      
      [outList newInv] = mergeAndCountInversions(half1, half2);
      
      numInversions += newInv;
      end
    end
    
  mergeSort(inList);
  
  [temp numInv] = mergeAndCountInversions([1 3 6], [2 5 9]);
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
      numInversions += length(list1);
      sorted = [sorted list1];
    end
  end
%}