%% Initialization
clear ; close all; clc

%% == Part One: Visualize the Data
fprintf('Plotting Data For Temperature and Energy----\n')

%% Load data from file
data = load('../dataTemp.csv');

%Create X and y column vectors with data
X = data(:,1);
y = data(:,5);

m = length(y);
plotData(X, y);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% == Part Two: Cost Function

% For convenience, we add a column filled  with ones to our X vector
X = [ ones(m, 1) X ];

%Creating a zeros column vector for theta parameters
fprintf('\nInitialize theta as zero values----\n')
theta = zeros(2, 1);

%Compute and plot initial cost
fprintf('\nComputing Cost Function for Zero Values on theta----\n')
J = cost(X, y,theta);
fprintf('With theta = [0 ; 0]\nCost computed = %f----\n', J);
fprintf('Expected cost value (approx) 104264.98----\n');

fprintf('Program paused. Press enter to continue.\n');
pause;

%% == Part Three: Gradient Descent

%Declare number of iterations and alpha
fprintf('\nDeclaring 50,000 iterations and alpha as 0.001----\n')
iterations = 50000;
alpha = 0.001;

fprintf('\nRunning Gradient Descent----\n')
theta = gradientDescent(X, y, theta, alpha, iterations);

fprintf('Program paused. Press enter to continue.\n');
pause;

% print theta to screen
fprintf('Theta found by gradient descent:\n');
fprintf('%f ----\n', theta);
fprintf('Expected theta values (approx)\n');
fprintf(' 497.1, -2.1 ----\n\n');

fprintf('Program paused. Press enter to continue.\n');
pause;

%Plot the line for the hypothesis
% keep previous plot visible
hold on;
%Only plot non one values for X (training examples)
fprintf('Plotting hypothesis\n');
plot(X(:,2), X*theta, '-')
legend('Training data', 'Linear regression')
hold off % don't overlay any more plots on this figure

%Visualizate J(theta_zero, theta_one)
% Grid over which we will calculate J
theta_zero_vals = linspace(-1800, 400, 40);
theta_one_vals = linspace(-180, 400, 40);

% Fill out J_vals
for i = 1:length(theta_zero_vals)
    for j = 1:length(theta_one_vals)
	  t = [theta_zero_vals(i); theta_one_vals(j)];
	  J_vals(i,j) = cost(X, y, t);
    end
end


% Because of the way meshgrids work in the surf command, we need to
% transpose J_vals before calling surf, or else the axes will be flipped
J_vals = J_vals';
% Surface plot
fprintf('Plotting Cost Function\n');
figure;
surf(theta_zero_vals, theta_one_vals, J_vals)
xlabel('\theta_zero'); ylabel('\theta_one');

fprintf('Program paused. Press enter to continue.\n');
pause;

% Contour plot
fprintf('Plotting gradient descent\n');
figure;
% Plot J_vals as 15 contours spaced logarithmically between 0.01 and 100
contour(theta_zero_vals, theta_one_vals, J_vals, logspace(-500, 400, 1600))
xlabel('\theta_zero'); ylabel('\theta_one');
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);

%Predicting examples
fprintf('Lets predict some data using our found theta\n');
fprintf('Load the example file\n');
EX = load('../testExamples.csv');
fprintf('Program paused. Press enter to continue\n');
pause;

%Separate data
fprintf('Separate the data in the file to get our X and y (y used to compare)\n');
X_example = EX(:, 1);
y_example = EX(:, 5);

%Get our matrix of ones and the X examples for predicting operation
X_example = [ ones( size(X_example) ), X_example ];

%Predict data
fprintf('Print our predicted data\n');
P = X_example * theta;
P

fprintf('Print our example data to compare\n');
y_example
fprintf('Program paused. Press enter to continue\n');
pause;