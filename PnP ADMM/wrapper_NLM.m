function out = wrapper_NLM(in, sigma)
    % out = imnlmfilt(in);
    out = imnlmfilt(in, 'DegreeOfSmoothing',sigma);
end