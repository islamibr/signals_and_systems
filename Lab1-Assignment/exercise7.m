%a)
A = zeros(5);

B = zeros(5,1);

%b)
A = [2 3 5 6 21; 5 0 2 2 0; 6 7 8 9 11; 0 13 17 5 6; 1 4 0 3 9];
%c)

B = [152; 19; 135; 127; 66];

%d)If the rank of the coefficients matrix (A) equals that of the augmented matrix
%equals the number of unknowns (5) that means that there is a unique solution for the 5 unknowns
%rank function syntax: rank(A)

%e)
k = size(A);
S = (rank(A)== k(1,2));

%f
X = A \ B;