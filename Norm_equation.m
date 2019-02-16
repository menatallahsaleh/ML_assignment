function [Thetas] = Norm_equation( variables,y )
%normal equation
Thetas=inv(transpose(variables)*variables)*(transpose(variables)*y);
end

