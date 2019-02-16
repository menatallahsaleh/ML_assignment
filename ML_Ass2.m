close all
clear all
clc
[num,~]=xlsread('heart_DD.csv');
y=num(:,14);
variables=num(:,1:13);
m=length(variables(:,1));
iter=10000;
alpha=0.001;
mse=zeros(1,iter);
% mean normalization
for i=1:length(variables(1,:))
    variables(:,i)=(variables(:,i)-mean(variables(:,i)))/std(variables(:,i));
end
[ hyp_1,hyp_2,hyp_3,hyp_4 ] = Hypotheses( variables );
hyp=hyp_2;
thetas_old=rand(length(hyp(1,:)),1);%ones(1,length(variables(1,:))+1);
thetas_new=zeros(length(hyp(1,:)),1);
%loop for each value of iterations
    for k=1:iter
        % to calculate hypothesis values 
            h=1./(1+exp(-1*hyp*thetas_old));
            diff=h-y;
        %loop for each value of theta
           thetas_new= thetas_old-(alpha/m)*transpose(hyp)*diff; 
           thetas_old=thetas_new;
           mse(1,k)=MSE_log(h,y);
    end
   plot(mse)