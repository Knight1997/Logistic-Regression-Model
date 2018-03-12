function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));
n=size(theta);

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


  h=1./(1+exp(-1*X*theta));
  J=  transpose(y)*log(h)+ transpose(ones(m,1)-y)*log(ones(m,1)- h);
  J=-1*(J/m)+ (lambda/(2*m))*sum(theta(2:n,1) .^2);
  
  grad=transpose(X)*(h-y);
  grad(2:n,:)=grad(2:n,:) +lambda*theta(2:n,:);
  grad=grad/m;





% =============================================================

end
