%{
Ivan Galakhov
Math research paper
The effect of number of inversion in a list on the runtime complexity of various
  sorting algorithms. 
%}
<<<<<<< HEAD
tempList = randomListWithNInversions(10000, 0);
[out temp] = quicksort(tempList);
disp("number of steps it took");
disp(temp);
=======

%small test about counting inversions

tests = [];
for i = 0:50
  tests = [tests (i*99 == countInversions(randomListWithNInversions(100, i*99)))];
  end
disp(tests); %should be all ones
>>>>>>> 2d2e91e7e474b82179b6b8c06e9fff530f427e9c
