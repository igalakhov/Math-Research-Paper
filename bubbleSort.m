function [listIn numSteps] = bubbleSort(listIn)
  numSteps = 0;  
  
  sorted = false;
  
  while(!sorted)
  sorted = true; %we're done if we don't swap at all while we iterate
  for i = 1 : (length(listIn) - 1)
    numSteps += 3;
    if(listIn(i) > listIn(i + 1))
      listIn = swap(i, i + 1, listIn);
      sorted = false;
      end
    end
  end
  
  function [in] = swap(idx1, idx2, in)
    dummy = in(idx1);
    in(idx1) = in(idx2);
    in(idx2) = dummy; 
    numSteps += 4;
    end

 end