function [q] = qindex(x, y)
    
    x = x(:);
    y = y(:);
    
    % x = normalize(x(:));
    % y = normalize(y(:));
    
    xm = mean(x);
    ym = mean(y);
    
    n = length(x);
    
    tmpx2 = zeros(1, n);
    tmpy2 = tmpx2;
    tmpxy = tmpx2;
    tmpx = tmpx2;
    tmpy = tmpx2;
    
    
    for i = 1:n
        tmpx2(i) = (x(i) - xm)^2;
        tmpy2(i) = (y(i) - ym)^2;
        tmpxy(i) = (x(i) - xm)*(y(i) - ym);
        tmpx(i) = (x(i) - xm);
        tmpy(i) = (y(i) - ym); 
    end
    
    sigma2x = sum(tmpx2)/(n - 1); 
    sigma2y = sum(tmpy2)/(n - 1); 
    sigmaxy = sum(tmpxy)/(n - 1);
    sigmax = sum(tmpx)/(n - 1);
    sigmay = sum(tmpy)/(n - 1);
    
    
    q = 4*sigmaxy*xm*ym/((sigma2x + sigma2y)*(xm^2 + ym^2));
end

