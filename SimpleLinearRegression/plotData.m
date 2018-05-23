function plotData(x, y)
%plotData function plots the data for x and y values
%and gives default axis for temperature and energy output

%Open a figure window
figure;

plot(x, y, 'rx', 'MarkerSize', 10);
ylabel('Energy Output in MW');
xlabel('Temperature in Celsius');

plotData(X, y);
