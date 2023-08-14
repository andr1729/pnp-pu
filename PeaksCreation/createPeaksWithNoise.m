function [reference, psi] = createPeaksWithNoise(densityPeaks, szImgPeaks, snr_)

% DESCRIPTION:
%   Genera una imagén con picos y una imagén envuelta de los picos con
%   ruido añadido con un SNR específico.
%
% INPUT:
%   densityPeaks - Densidad de los picos/altura de ellos
%   szImgPeaks   - Damaño de las imagenes de salida, szImgPeaks x n
%   snr_         - Valor deseado de snr en psi.
%
% OUTPUT:
%   reference - Imagen de picos origninal, desenvuelta y sin ruido.
%   psi       - Imagen de referencia envuelta y con ruido añadido con el
%   SNR especificado.

    reference = peaks(szImgPeaks)*densityPeaks;
    psi = awgn(wrapToPi(reference) ,snr_,'measured');
    snr_ = snr(wrapToPi(reference), psi-wrapToPi(reference)); % Check SNR
    psi = wrapToPi(psi);

end

