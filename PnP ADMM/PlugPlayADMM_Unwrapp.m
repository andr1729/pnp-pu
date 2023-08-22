function [out, optimalPhi] = PlugPlayADMM_Unwrapp(psi, lambda, method, opts, reference)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%out = PlugPlayADMM_deblur(y,h,lambda,method,opts)
%deblurs image y by solving the ADMM:
%
%inversion step: x=argmin_x(||Ax-y||^2+rho/2||x-(v-u)||^2)
%denoising step: v=Denoise(x+u)
%      update u: u=u+(x-v)
%
%Input:           y    -  the observed gray scale image
%                 h    -  blur kernel
%              lambda  -  regularization parameter
%              method  -  denoiser, e.g., 'BM3D'
%       opts.rho       -  internal parameter of ADMM {1}
%       opts.gamma     -  parameter for updating rho {1}
%       opts.maxitr    -  maximum number of iterations for ADMM {20}
%       opts.tol       -  tolerance level for residual {1e-4}   
%       ** default values of opts are given in {}. 
%
%Output:          out  -  recovered gray scale image 
%
%Xiran Wang and Stanley Chan
%Copyright 2016
%Purdue University, West Lafayette, In, USA.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% set parameters
tol       = opts.tol;
gamma     = opts.gamma;
max_itr   = opts.max_itr;
epsilon       = opts.epsilon;

%initialize variables
dim         = size(psi);          
N           = dim(1)*dim(2);    
v           = closedSolution(psi, 0, 0);  
x           = v;    %v;
u           = zeros(dim);
residual    = inf;

%set function handle for denoiser
switch method
    case 'BM3D'
        denoise=@wrapper_BM3D;
    case 'TV'
        denoise=@wrapper_TV;
    case 'NLM'
        denoise=@wrapper_NLM;
    case 'RF'
        denoise=@wrapper_RF;
    otherwise
        error('unknown denoiser \n');
end

% main loop
if opts.print==true  
    fprintf('Plug-and-Play ADMM --- Phase Unwrapping \n');
    fprintf('Denoiser = %s \n\n', method);
    fprintf('itr \t ||x-xold|| \t ||v-vold|| \t ||u-uold|| \t qv \t qx \n');
end

itr = 1;

% preallocate
vAll = zeros(dim(1), dim(2), max_itr);
QAll = zeros(1, max_itr);

while(residual>tol&&itr<=max_itr)
    %store x, v, u from previous iteration for psnr residual calculation
    x_old = x;
    v_old = v;
    u_old = u;

    %inversion step
    xtilde = v - u;
    x      = closedSolution(psi, xtilde, epsilon);

    %denoising step
    vtilde = x + u;
    vtildeMin = min(vtilde(:));
    vtildeMax = max(vtilde(:)); % 0.48

    vtilde = resc01(vtilde);

    % sigma  = sqrt(lambda/epsilon);
    sigma = lambda/epsilon;
    v      = denoise(vtilde, sigma);

    v = rescale(v, vtildeMin, vtildeMax);
   
    %update langrangian multiplier
    u      = u + (x-v);
    
    %update epsilon
    epsilon = epsilon*gamma;
    % epsilon = epsilonRegularizer(epsilon, x, v, v_old);

    %calculate residual
    residualx = (1/sqrt(N))*(sqrt(sum(sum((x-x_old).^2))));
    residualv = (1/sqrt(N))*(sqrt(sum(sum((v-v_old).^2))));
    residualu = (1/sqrt(N))*(sqrt(sum(sum((u-u_old).^2))));
    
    % regularizer
    residual = residualx + residualv + residualu;
    
    qv = Q(resc01(v), resc01(reference));  
    qx = Q(resc01(x), resc01(reference));  

    if opts.print==true && mod(itr, 1)==0
         fprintf('%3g \t %3.5e \t %3.5e \t %3.5e \t %3g \t %3g  \t \n', itr, residualx, residualv, residualu, qv, qx);
    end  
  
    % subplot(1,2,1),imagesc(v); axis off;
    % axis square; colorbar; title('v') 
    % subplot(1,2,2),imagesc(x);  axis off;
    % axis square; colorbar; title('x')
    % pause(1) uncommner
    vAll(:, :, itr) = v;
    QAll(1, itr) = qv; 
    
    itr = itr + 1;
    
end
out = v;

% se ecnuentra el valor maximo del Quality Index 
[maxQ, indxOptimalQ] = max(QAll);
maxQ;
    
% se encuentra la recuperacion optima
optimalPhi = vAll(:, :, indxOptimalQ);

end
