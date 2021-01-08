clear all
close all
clc
[y Fs] = audioread('sound.wav');


%% echo generation
u =add_echo(y,Fs,0.15,0.75);
timelag = 0.15;
delta = round(Fs*timelag);
alpha = 0.75;
echo = [zeros(delta,1);y]*alpha;
orig = [y;zeros(delta,1)];
mtEcho = u;
%% Plot the original, the echo, and the resulting signal.
t = (0:length(mtEcho)-1)/Fs;

subplot(2,1,1)
plot(t,[orig echo])
legend('Original','Echo')

subplot(2,1,2)
plot(t,mtEcho)
legend('Total')
xlabel('Time (s)')

%% Compute an unbiased estimate of the signal autocorrelation. Select and plot the section that corresponds to lags greater than zero.
[Rmm,lags] = xcorr(mtEcho,'unbiased');

Rmm = Rmm(lags>0);
lags = lags(lags>0);

figure
plot(lags/Fs,Rmm)
xlabel('Lag (s)')

%% The autocorrelation has a sharp peak at the lag at which the echo arrives. Cancel the echo by filtering the signal through an IIR system whose output, , obeys .
[~,dl] = findpeaks(Rmm,lags,'MinPeakHeight',0.001);

mtNew = filter(1,[1 zeros(1,dl-1) alpha],mtEcho);
%% Plot the filtered signal and compare to the original.
figure
subplot(2,1,1)
plot(t,orig)
legend('Original')

subplot(2,1,2)
plot(t,mtNew)
legend('Filtered')
xlabel('Time (s)')
