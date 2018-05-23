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

%% == Part Two: Cost Function

% For convenience, we add a column filled  with ones to our X vector
X = [ ones(m, 1) X ];

%Creating a zeros column vector for theta parameters
theta = zeros(2, 1);

%Compute and plot initial cost
J = cost(X, y,theta);
fprintf('With theta = [0 ; 0]\nCost computed = %f----\n', J);
fprintf('Expected cost value (approx) 104264.98----\n');

%% == Part Three: Gradient Descent

%Declare number of iterations and alpha
iterations = 1500;
alpha = 0.1;

fprintf('\nRunning Gradient Descent----\n')
theta = gradientDescent(X, y, theta, alpha, iterations);

% print theta to screen
fprintf('Theta found by gradient descent:\n');
fprintf('%f ----\n', theta);
fprintf('Expected theta values (approx)\n');
fprintf(' number, number ----\n\n');

%Plot the line for the hypothesis
% keep previous plot visible
hold on;
%Only plot non one values for X (training examples)
plot(X(:,2), X*theta, '-')
legend('Training data', 'Linear regression')
hold off % don't overlay any more plots on this figure

%Visualizate J(theta_zero, theta_one)

% Grid over which we will calculate J
theta_zero_vals = linspace(-10, 10, 100);
theta_one_vals = linspace(-1, 4, 100);

% Fill out J_vals
for i = 1:length(theta_zero_vals)
    for j = 1:length(theta_one_vals)
	  t = [theta_zero_vals(i); theta_one_vals(j)];
	  J_vals(i,j) = computeCost(X, y, t);
    end
end


% Because of the way meshgrids work in the surf command, we need to
% transpose J_vals before calling surf, or else the axes will be flipped
J_vals = J_vals';
% Surface plot
figure;
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_zero'); ylabel('\theta_one');

% Contour plot
figure;
% Plot J_vals as 15 contours spaced logarithmically between 0.01 and 100
contour(theta_zero_vals, theta_one_vals, J_vals, logspace(-2, 3, 20))
xlabel('\theta_zero'); ylabel('\theta_one');
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);