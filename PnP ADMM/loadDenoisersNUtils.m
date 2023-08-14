function [] = loadDenoisersNUtils()

% DESCRIPTION:
%   Carga los denoisers a utilizar.

addpath(genpath('./utilities/'));
addpath(genpath('./denoisers/TV/'));
addpath(genpath('./denoisers/NLM/'));
addpath(genpath('./denoisers/RF/'));
addpath(genpath('./denoisers/bm3d/'));
end

