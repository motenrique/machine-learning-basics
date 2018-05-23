function theta = gradientDescent(X, y, theta, alpha, iterations)
%Computes the Gradient Descent for dataset.
%X and y represent the data, alpha represents the step size for gradient
%and iterations is the number of times to run the update for theta

%initialize the size of data set
m = length(y);

%We want to save the cost function values over each iteration, we can use the following variable
J_CostHistory = zeros(iterations, 1);

%Complete the calculation for gradient descent over the number of iterations
for iteration = 1:iterations
  
  h_theta = X * theta;
  
  differences_one = (h_theta - y)' * X(:, 1);
  differences_two = (h_theta - y)' * X(:, 2);
  
  temporal_h_one = theta(1) - ( alpha * ( (1/m) * sum(differences_one) ) );
  temporal_h_two = theta(2) - ( alpha * ( (1/m) * sum(differences_two) ) );
  
  theta(1) = temporal_h_one;
  theta(2) = temporal_h_two;
  
end

end
