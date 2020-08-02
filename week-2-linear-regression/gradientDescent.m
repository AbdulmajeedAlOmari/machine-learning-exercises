function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta.
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    Prediction = X * theta;

    Error = (Prediction - y);

    lengthOfTheta = length(theta);

    Temp = zeros(1, lengthOfTheta);

    for i = 1:lengthOfTheta
        Temp(i) = sum(Error .* X(:, i));
    end;

    theta = theta - alpha * (1/m) * Temp';

    % This statement is used for Debugging
    % fprintf('[%f] Cost computed = %f\n', iter, computeCost(X, y, theta));

    % ============================================================

    % Save the cost J in every iteration
    J_history(iter) = computeCost(X, y, theta);

end

end
