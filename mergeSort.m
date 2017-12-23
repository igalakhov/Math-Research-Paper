function [listIn numSteps] = mergeSort(listIn)
  listLength = length(listIn);
  numSteps = 0;
  len = 1; %size of arrays we merge, multiply by 2 each time
  while(len < listLength)
    lo = 1;
    while(lo < listLength - len)
      mid = lo + len - 1;
      hi = min(lo + len*2 - 1, listLength);
      listIn = merge(listIn, lo, mid, hi);
      lo += len*2;
    end
  
    len *= 2;
  end
  function [in] = merge(in, l, m, h)
    list1 = in(l:m);
    list2 = in(m+1:h);
    merged = [];
    while(length(list1) != 0 && length(list2) != 0)
      numSteps += 4; %two acesses, one comparison, one write (to merged)
      element1 = list1(1); 
      element2 = list2(1);
      if(element1 < element2)
        merged = [merged element1];
        list1 = list1(2:end);
      else
        merged = [merged element2];
        list2 = list2(2:end);
      end
    end
    if(length(list1) == 0)
      merged = [merged list2];
      numSteps += length(list2);
    end
    if(length(list2) == 0)
      merged = [merged list1];
      numSteps += length(list1);
    end
        in(l:h) = merged;
    end
  end