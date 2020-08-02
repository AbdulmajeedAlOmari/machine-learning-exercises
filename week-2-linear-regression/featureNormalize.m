function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% You need to set these values correctly
X_norm = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));

% ====================== YOUR CODE HERE ======================
% Instructions: First, for each feature dimension, compute the mean
%               of the feature and subtract it from the dataset,
%               storing the mean value in mu. Next, compute the
%               standard deviation of each feature and divide
%               each feature by it's standard deviation, storing
%               the standard deviation in sigma.
%
%               Note that X is a matrix where each column is a
%               feature and each row is an example. You need
%               to perform the normalization separately for
%               each feature.
%
% Hint: You might find the 'mean' and 'std' functions useful.
%
function meanValue = mean(vector);
  numberOfElements = length(vector);

  totalSum = sum(vector);

  meanValue = totalSum / numberOfElements;
endfunction;

function standardDeviationValue = std(meanValue, vector);
  numberOfElements = length(vector);

  totalSqrOfDistanceFromMean = 0.0;

  for j=1:numberOfElements
    totalSqrOfDistanceFromMean += (vector(j) - meanValue)^2;
  end;

  standardDeviationValue = sqrt(totalSqrOfDistanceFromMean / (numberOfElements - 1));
endfunction;

for i=1:size(X, 2)
  featureColumn = X(:, i); % Store feature in column

  % for n=1:length(featureColumn)
  %   fprintf('%f', featureColumn(n))
  %   if n < length(featureColumn)
  %     fprintf(', ')
  %   else
  %     fprintf('\n')
  %   end
  % end;

  % disp('---------[Getting mean value]---------')

  meanValue = mean(featureColumn); % Get mean of the (i) feature

  % disp('---------[Getting std value]---------')

  stdValue = std(meanValue, featureColumn); # Get standard deviation of the (i) feature

  % disp('---------[Setting sigma, mu and X_norm values]---------')

  % fprintf('i = %f \n',  i);

  mu(i, 1) = meanValue;
  sigma(i, 1) = stdValue;
  X_norm(:, i) = (X_norm(:, i) - meanValue) / stdValue;
end;
% ============================================================

end
