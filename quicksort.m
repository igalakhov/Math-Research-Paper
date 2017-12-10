%{
Quicksort!

This is the function that does the quicksort algorithm. It takes in an unsorted 
list and returns the sorted list and the number of steps that it took to sort 
the list. For the purposes of this paper, the pivot is chosen as the last element. 
Note that this function is not recursive and instead uses a stack to simulate recursion. 

%}

function [sorted numSteps] = quicksort(listIn)
  numSteps = 0;
  dispList = [listIn'];
  
  %partitions listI from hi to lo inclusive, usus
  function [partitioned pivotPos] = partition(toPartition, lo, hi)
    partitioned = toPartition;
    
    %extract the list we have to partition
    cutOutPartitionList = toPartition(lo:hi - 1);
    
    pivot = toPartition(hi:hi);
    
    pivotPos = hi;
    
    partitioned = [pivot];
    
    %partition the list
    for i = 1:length(cutOutPartitionList)
      curElement = cutOutPartitionList(i);
      numSteps += 1;
      if(curElement > pivot)
        partitioned = [partitioned curElement];
        numSteps += 1;
        pivotPos -= 1;
      else
        partitioned = [curElement partitioned];
        numSteps += 1;
        end
      end
      
    %put the extracted list back in
    rightSide = toPartition(hi + 1 : end);
    leftSide = toPartition(1 : lo - 1);
    partitioned = [leftSide partitioned rightSide];  
  end
  
  %initialize the stack with all the part with have to partition
  stack = [];
  stack = [1 stack];
  stack = [length(listIn) stack];
  
  sorted = listIn;
  
  while(length(stack) != 0)
   %extract the first two elements from stack
   curHi = stack(1:1);
   curLo = stack(2:2);
   stack = stack(3:end);
   
   dispList = [dispList sorted'];
   
   %partition the list
   [sorted pivotPos] = partition(sorted, curLo, curHi);
   
   %push more values into our stack if needed
   if (pivotPos + 1) < curHi
    stack = [curHi (pivotPos + 1) stack];
    end
   
   if (pivotPos - 1) > curLo
    stack = [(pivotPos - 1) curLo stack];
    end
 
  end
  dispList = [dispList sorted'];
  imagesc(dispList);
  
end