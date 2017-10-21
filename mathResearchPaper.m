%{
Ivan Galakhov
Math research paper
The effect of number of inversion in a list on the runtime complexity of various
  sorting algorithms. 
%}

%small test about counting inversions

tests = [];
for i = 0:50
  tests = [tests (i*99 == countInversions(randomListWithNInversions(100, i*99)))];
  end
disp(tests); %should be all ones