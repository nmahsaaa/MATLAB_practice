clc
close all
clear all
[y fs] = audioread('sound.wav');
u =add_echo(y,fs,0.15,0.75);
%soundsc(u,fs)

%% saving generated sound
filename = 'c.wav';
audiowrite(filename,u,fs);

%% ploting in frequency domain
n=length(u)-1;
f=0:fs/n:fs;
wavefft=abs(fft(u)); % perform Fourier Transform 

plot(f,wavefft); % plot Fourier Transform 


%% impulse response
h = echo_filter(u, 0.15, 0.75, fs);
nn=length(h)-1;
ff=0:fs/nn:fs;
wavefft=abs(fft(h)); % perform Fourier Transform 
figure 
plot(ff,wavefft); % plot Fourier Transform 
title('Impulse Response');
xlabel('frequency');
ylabel('h')

