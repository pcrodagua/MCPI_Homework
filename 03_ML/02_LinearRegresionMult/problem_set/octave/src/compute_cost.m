%% Compute Cost Function
function J = computeCost(X, y, theta)
  m = length(y); 
  J = 0;
  % J = 1/(2*m) * (X * theta - y)' * (X * theta - y); 
  for i = 1:m,
     J = J + 1/(2*m) * (theta' * X(i,:)' - y(i)) ** 2;
  endfor
end
