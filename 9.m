clc
close all
clear all

t = 0.1:0.001:5;
f1 = 40;
f2 = 300;
s1 = sin(2*pi*t*f1);
soundsc(s1)
s2 = sin(2*pi*t*f2);
soundsc(s2)
s = s1.*s2;
n=length(s)-1;
f=0:1/(5*n):1/5;
sfft=abs(fft(s)); % perform Fourier Transform 

plot(f,sfft);
xlabel('frequency')
ylabel('S')