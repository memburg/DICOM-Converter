clc;
clear;
close all;

% source doesn't require an ending backslash
source = 'C:\Users\memburg\Desktop\dcm';
% destination does require an ending backslash
destination = 'C:\Users\memburg\Desktop\png\';
extension = '.png';

dcmconvert(source, destination, extension);