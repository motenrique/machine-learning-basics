function J = cost(X, y, theta)
%Cost function for linear regression
%Needed X and y values for data and theta as parameter

%Get the size of the dataset
m = length(y);

%Value to be returned as the result of the cost function
J = 0;

%Complete the calculation of cost function

h_theta = X * theta;
squareErrors = (h_theta - y).^2;

J = (1/(2*m))*( sum(squareErrors) );

end
