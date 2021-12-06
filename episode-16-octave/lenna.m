#!/usr/bin/env octave

img = imread("lenna.png");
img2 = img(:, columns(img):-1:1, :);
imwrite(img2, "lenna_mirror.png");
