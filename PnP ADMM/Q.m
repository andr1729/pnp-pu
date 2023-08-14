function [Q, tmp] = Q(x,y)
% Sliding window

[m, n] = size(x);
ws = 8;

totalWin = m - ws + 1;

tmp = zeros(1, totalWin);
iter = 1;

for i = 1:totalWin
    for j = i:totalWin
        xt = x(i: i + ws - 1, j:j + ws - 1);
        yt = y(i: i + ws - 1 , j:j + ws - 1);

        tmp(1, iter) = qindex(xt, yt);
        iter = iter + 1;
    end
end

Q = mean(tmp);

end

