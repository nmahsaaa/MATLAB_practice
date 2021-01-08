% function impulse_Coeff:
%      computes and returns the impulse response h of the LTI system (echo filter)

%
% INPUTS:
% signal = input signal
% times = vector containing the time delays (in seconds) of the repetitions(echoes)
% attenuations = vector containing the respective attenuations of the echoes
% fs = sampling frequency of the input signal.
%
% OUTPUTS:
% yecho = output signal (passed through the echo filter)
% h = impulse response of the echo filter.

function h = Impulse_Coeff(signal, times, attenuations, fs)

h(1)=1; % This is the first coefficient of the echo filter

% Computing the impulse response h
for i=1:length(times),
    samples(i) = times(i)*fs; % Calculating the sample-times (N = t*fs)
    h(floor(samples(i))) = attenuations(i); % Impulse response coeficients
end

