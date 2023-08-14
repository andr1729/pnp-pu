function [] = plotPhases(reference, acquired, reconstruction)

% DESCRIPTION:
%   Plotea las imagenes de fase con sus respectivas métricas.

figure;
subplot(1, 3, 1); imagesc(resc01(reference)); colorbar; axis image; title('Original');
subplot(1, 3, 2); imagesc(acquired); colorbar; axis image; title('Acquired');
subplot(1, 3, 3); imagesc(resc01(reconstruction)); colorbar; axis image; title('Reconstruction');
end
