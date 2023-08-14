function out = wrapper_BM3D(in, sigma)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% out = wrapper_BM3D(in,sigma)
% performs BM3D denoising
% 
% Require BM3D package
%
% Download:
% http://www.cs.tut.fi/~foi/GCF-BM3D/
%
% Xiran Wang and Stanley Chan
% Copyright 2016
% Purdue University, West Lafayette, In, USA.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %[out] = BM3D(in, sigma,'refilter');

% [out] = BM3D(in, sigma.*ones(1,13));

[out] = BM3DDEB(in, sigma, fspecial('gaussian', 25, 1.2));
 out = normalize(out);
end