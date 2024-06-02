function [u] = delta(x)
u = zeros(size(x));
for n = 1:length(x)
    if x(n) == 0
        u(n) = 1;
    else
        u(n) = 0;
    end
end