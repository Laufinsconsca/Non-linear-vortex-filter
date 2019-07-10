function vortex = vortex_filter(r, n, pow_fi, tp_input)
h=2*r/n;
x=-r:h:r-h;
y=x;
% this for functionally dependent topological charge
tp = dependent_top_charge(y,x);
vortex = zeros(size(y,2), size(x,2));
%---------------------------------------------------
if nargin == 3
    tp_input = tp;
end
for j=1:size(y,2)
    for k=1:size(x,2)
    if nargin == 3
    q = round(sqrt((j-n/2-1)^2 + (k-n/2-1)^2))+1;
    else 
    q = 1;
    end
    angle = atan2(-y(j),x(k));
    if angle < 0
        angle = angle + 2*pi;
    end
    vortex(j,k) = exp(1i*tp_input(q)*angle.^pow_fi);
    end
end
end
