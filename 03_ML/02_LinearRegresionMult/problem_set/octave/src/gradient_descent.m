%% Gradient descent algorithm
function [theta, J_history] = (X, y, theta, alpha, num_iters)
  m = length(y); 
  J_history = zeros(num_iters, 1);
  
  for iter = 1:num_iters
    Update = 0;
    for i=1:m,
        Update = Update + alpha/m * (theta' * X(i,:)' - y(i)) *  X(i,:)';
    endfor
    theta = theta - Update;   
    J_history(iter) = computeCost(X, y, theta);
  endfor 
end