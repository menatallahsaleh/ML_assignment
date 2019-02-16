function [ mse ] = MSE_log( h,y )
m=length(y);
mse=(1/m)*sum(-1*y.*log(h)-(1-y).*log(1-h));
end

