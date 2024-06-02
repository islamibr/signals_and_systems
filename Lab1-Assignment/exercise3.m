% Exercise 3

V = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10];

%a
V([end-2 end-1 end]) = V([end-2 end-1 end]) + 2; 

%b
V([end-3 end-2 end-1 end]) = V([end end-1 end-2 end-3]);

%c
V(mod(V, 2) == 0) = V(mod(V, 2) == 0) + V(mod(V,2) == 1); 
