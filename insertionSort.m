%{
  Insertion sort!
%}

function [sorted numSteps] = insertionSort(listIn)
  numSteps = 0;
  sorted = [listIn(1)]; %sorted will have one element in it
  numSteps += 2;
  
  %first select element
  for i = 2:length(listIn)
    curElement = listIn(i);
    numSteps += 1;
    
    %then insert it into the sorted array
    insertionIndex = 0;
    for j = length(sorted):-1:1
      numSteps += 2;
      if (sorted(j) < curElement)
        insertionIndex = j;
        break
        end
      
      end
    %insert new element into our sorted list based on insertion Index
    numSteps += 1;
    sorted = [sorted(1:insertionIndex) curElement sorted(insertionIndex + 1: end)];
    end
  
  end