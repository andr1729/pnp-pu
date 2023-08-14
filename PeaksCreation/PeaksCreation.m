clearvars; close all force; clc;
 
densityPeaks = 5;
szImgPeaks   = 512;
snr_ = 1;
[reference, psi] = createPeaksWithNoise(densityPeaks, szImgPeaks, snr_);




