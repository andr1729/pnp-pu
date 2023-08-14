function [phi] = closedSolution(psi, x_old, epsilon)


% get the wrapped differences of the wrapped values
dx = [zeros([size(psi,1),1]), wrapToPi(diff(psi, 1, 2)), zeros([size(psi,1),1])];
dy = [zeros([1,size(psi,2)]); wrapToPi(diff(psi, 1, 1)); zeros([1,size(psi,2)])];
rho = diff(dx, 1, 2) + diff(dy, 1, 1) - (epsilon/2)*x_old;

% Discrete cosine transform
dctRho = dct2(rho);

[N, M] = size(rho);
[I, J] = meshgrid(0:M-1, 0:N-1);
dctPhi = dctRho ./ (2 .* (cos(pi*I/M) + cos(pi*J/N) - epsilon/4 - 2));
dctPhi(1,1) = 0; % handling the inf/nan value

% compute the unwrapped and restored phase
phi = idct2(dctPhi);
end

