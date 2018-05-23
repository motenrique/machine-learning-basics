%% Initialization
clear ; close all; clc

fprintf('Plotting Data ...\n')
data = load('../dataTemp.csv');

X = data(:,1);
y = data(:,5);

m = length(y);
plotData(X, y);
