% Exercise 4

M = [1 2 3 4;
     -1 -2 -3 -4;
     1 2 3 4;
     -1 -2 -3 -4];
 

%a)
M(:,[1 2 3 4]) = M(:,[4 3 2 1]);

%b)
M([1 2 3 4],:) = M([4 3 2 1],:);

%c)
M(:,[2 3]) = M(:,[3 2]);

%d)
M([1 4],:) = M([4 1],:);

%e)
M([1 2 3 4],[1 2 3 4]) = M([1 3 4 2],[3 2 4 1]);

