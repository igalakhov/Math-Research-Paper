%{
Ivan Galakhov
Math research paper
The effect of number of inversion in a list on the runtime complexity of various
  sorting algorithms. 
%}
tempList = randomListWithNInversions(10000, 0);
[out temp] = quicksort(tempList);
disp("number of steps it took");
disp(temp);