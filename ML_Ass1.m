close all
clear all
clc
[num,~]=xlsread('house_prices_data_training_data.csv');
[num_cv,~]=xlsread('house_data_complete.csv');
variables=num(1:end,4:7);
variables_cv=num_cv(1:end,4:7);
% mean normalization
for i=1:length(variables(1,:))
    variables(:,i)=(variables(:,i)-mean(variables(:,i)))/std(variables(:,i));
    variables_cv(:,i)=(variables_cv(:,i)-mean(variables_cv(:,i)))/std(variables_cv(:,i));
end
y=(num(:,3)-mean(num(:,3)))/std(num(:,3));
y_cv=(num_cv(:,3)-mean(num_cv(:,3)))/std(num_cv(:,3));
iter=1000;
alpha=[0.000001];
mse=zeros(length(alpha),iter);
mse_cv=zeros(length(alpha),iter);
m=length(variables(:,1));
[ hyp_1,hyp_2,hyp_3,hyp_4 ] = Hypotheses( variables );
[ hyp_cv_1,hyp_cv_2,hyp_cv_3,hyp_cv_4 ] = Hypotheses( variables_cv );
hyp=hyp_3;
hyp_cv=hyp_cv_3;
thetas_old=rand(length(hyp(1,:)),1);%ones(1,length(variables(1,:))+1);
thetas_new=zeros(length(hyp(1,:)),1);
lamda=[0.01];
    %loop for each value of iterations
    for l=1:length(alpha)
    for k=1:iter
        % to calculate hypothesis values 
       h=hyp*thetas_old;
       diff=h-y;
       thetas_new= thetas_old-(alpha(l)/m)*transpose(hyp)*diff; 
       
       mse_cv(l,k)=MSE((hyp_cv*thetas_old)-y_cv)+(lamda/(2*m))*sum(thetas_old.^2);
       mse(l,k)=MSE(diff);
        thetas_old=thetas_new;
    end
   end
plot(mse(1,:),'b')
xlabel('No. of iterations')
ylabel('MSE')
%normal equation
thetas=Norm_equation(variables,y);
% to calculate Cross validation error
%h_cv=sum(thetas_old.*variables_cv(i,:))
%diff_cv=h_cv-y_cv(i);