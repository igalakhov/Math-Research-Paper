%{
This function generates a list of length l with n inversions using a modified 
version of the Steinhaus–Johnson–Trotter algorithm described below. 

Modified Steinhaus–Johnson–Trotter algorithm:
1. Generate a list of random integers of length l such that the sum of all these 
   numbers is n and very mth number (staring with 1) can have the maximum value of 
   m - 1. 
2. Run the SteinHaus-Jonson-Trotter algorithm using the list generated above as
   the amount of inversion we generate at every step
%}

function [outList] = randomListWithNInversions(listLength, numInversions)
  %step 1, create inversionList
  inversionListTemp = false(1, ((listLength - 1) * listLength)/2);
  inversionListTemp(1 : numInversions) = true;
  inversionListTemp = inversionListTemp(randperm(length(inversionListTemp)));
  inversionList = zeros(1, listLength - 1);
  for i = 1:(listLength - 1)
    inversionList(i) = sum(inversionListTemp(lowerBound(i):upperBound(i)));
    end
  inversionList = [0 inversionList];
  
  outList = [];
end
%helper functions
function [out] = addAllUpTo(a) out = ((a/2)*(a-1)); end
function [out] = upperBound(x) out =  x + x*(x-1)/2; end
function [out] = lowerBound(x) out = 1 + x*(x-1)/2; end
