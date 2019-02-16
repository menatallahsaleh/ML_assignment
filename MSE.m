function [ mse] = MSE(diff)
m=length(diff);
mse=(1/(2*m))*sum((diff.^2));
end

