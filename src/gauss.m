function [y] = gauss(x, sigma)
y = zeros(1, size(x,2));
for i = 1:size(x,2)
y(1,i) = exp(-x(1,i).^2/(2*sigma.^2))/sqrt(sqrt(pi));
end
end

