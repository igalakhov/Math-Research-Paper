%{
This function generates a list of length l with n inversions using a modified 
version of the Steinhaus–Johnson–Trotter algorithm described below. 

Modified Steinhaus–Johnson–Trotter algorithm:
1. Generate a list of random integers of length l such that the sum of all these 
   numbers is n.
2. Modify this list such that every mth number can have the maximum value of 
   m - 1
%}

function [outList] = randomListWithNInversions(listLength, numInversions)
  
  %1. generate a list of random integers of length l with sum n 
  inversionNums = rand(1, listLength);
  sumAll = sum(inversionNums);
  
  for i = 1:length(inversionNums)
    inversionNums(i) = round((inversionNums(i) / sumAll) * numInversions); 
    end
  
  %account for rounding errors in the step above
  if 1 == 1
    
    end
  disp(sum(inversionNums));
  end