%{
This function generates a list of length l with n inversions using a modified 
version of the Steinhaus–Johnson–Trotter algorithm described below. 

Modified Steinhaus–Johnson–Trotter algorithm:
1. Generate a list of random integers of length l such that the sum of all these 
   numbers is n and very mth number (staring with 1) can have the maximum value of 
   m - 1. 
%}

function [outList] = randomListWithNInversions(listLength, numInversions)
  %step 1, create inversionList
  inversionListTemp = false(1, ((listLength - 1) * listLength)/2);
  inversionListTemp(1 : numInversions) = true;
  inversionListTemp = inversionListTemp(randperm(length(inversionListTemp)));
  inversionList = zeros(1, listLength - 1);
  for i = 1:(listLength)
    disp(int2str(addAllUpTo(i - 1) + 1))
    
    end
end
%helper functions
function [out] = addAllUpTo(a) out = ((a/2)*(a-1)); end
