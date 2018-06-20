# Machine Learning Basics Workshop

The purpose of this workshop is to review the most basic topics about machine learning and implement a 
basic linear regression model.

### Setup

For this wirkshop we need a numerical calculus programming language, for this we can use the following options:

- Matlab
- Octave version 4.4.0

Once the software is installed, we may use the GUI for both lenguages or the console to implement and run our desired features.


## Exercise 1 - Linear Regression Model

Using an extract of 100 examples of the following Dataset: Combined Cycle Power Plant - http://archive.ics.uci.edu/ml/datasets/Combined+Cycle+Power+Plant
we have to find the hypothesis function, cost function and predict some data for new records.

### Complete Cost Function Calculation

Using the file `cost.m` inside the folder `SimpleLinearRegression` complete the code to calculate effectively the cost function for parameters X, y and theta

### Complete Gradient Descent Calculation

Using the file `gradientDescent.m` inside the folder `SimpleLinearRegression` complete the code to perform the algorithm for linear regression and minimize the cost function for
parameters X, y and theta


## Useful Tips

The code presented here is executed on Octave, but it can be done by the same way in Matlab

#### Create a variable
```
x = 2
```
Now we can use the variable x in our context

#### Create a matrix
```
A = [1 2 3; 4 5 6]
```
Output
```
A = 
  1   2   3
  4   5   6
```

#### Create a Row Vector
```
RV = [3 4 5]
```
Output
```
RV =
  3   4   5
```

#### Create a Column Vector
```
CV = [5; 6; 7]
```
Output
```
CV =
  5
  6
  7
```

#### Extract A column from Matrix
```
A = [1 2 3; 4 5 6];

C = A(:, 2)
```
`#Semicolon means no output for current operation`
`#Colon means take a range of data, number before is the init and number after is the end. The number after comma represents the column number to take (Colon operation is supported there too)`

Output
```
C = 
  2
  5
```
