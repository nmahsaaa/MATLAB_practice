clc
close all
clear all

img = imread('ax.jpg');
j = rgb2gray(img);
kernel = [-1 -1 -1;-1 8 -1;-1 -1 -1];
filteredImage = imfilter(j, kernel, 'same');
imshow(filteredImage)
 