%% Compute Cost Function
function J = computeCost(X, y, theta)
  m = length(y); 
  J = 0;
  % J = 1/(2*m) * (X * theta - y)' * (X * theta - y); 
  for i = 1:m,
     J = J + 1/(2*m) * (theta' * X(i,:)' - y(i)) ** 2;
  endfor
end


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

out = sprintf('%0.5f ', computeCost(X1, Y1, [0.5 -0.5]'));