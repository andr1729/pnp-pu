%% Load Denoisers and Utils
clearvars; close all force; clc; loadDenoisersNUtils;

%% Load Phases
densityPeaks = 4;
szImgPeaks   = 512;
snr_ = 5;

[reference, psi] = createPeaksWithNoise(densityPeaks, szImgPeaks, snr_);

%% Parameters
method = 'RF'; % BM3D, NLM, TV 
opts.epsilon     = 3;
opts.gamma   = 1.01;
lambda = 30;

opts.max_itr = 20;
opts.print   = true;
opts.tol     = 1e-8;

%% Main Routine
[out, optimalPhi] = PlugPlayADMM_Unwrapp(psi, lambda, method, opts, reference);

%% Plots
plotPhases(reference, psi, optimalPhi);
