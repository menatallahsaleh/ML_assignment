function [ hyp_1,hyp_2,hyp_3,hyp_4 ] = Hypotheses( variables )
x_o=ones(length(variables(:,1)),1); 
%% hypothesis
% hypothesis 1(linear)%
hyp_1=[x_o variables];
%hypothesis 2(quad)%
hyp_2=[x_o variables variables.^2];
%hypothesis 3(cubic)%
hyp_3=[x_o variables variables.^2 variables.^3];
%hypothesis 4(power 4)%
hyp_4=[x_o variables variables.^2 variables.^3 variables.^4];


end

