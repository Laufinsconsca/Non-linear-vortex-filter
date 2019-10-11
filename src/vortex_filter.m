function vortex = vortex_filter(r, n, pow_fi, tp_input, isSymmetry)
h=2*r/n;
x=-r:h:r-h;
y=x;
%
% this for functionally dependent topological charge
tp = dependent_top_charge(y,x, tp_input);
vortex = zeros(size(y,2), size(x,2));
%---------------------------------------------------
for j=1:size(y,2)
    for k=1:size(x,2)
    q = round(sqrt((j-n/2-1)^2 + (k-n/2-1)^2))+1;
    angle = atan2(-y(j),x(k));
    if isSymmetry == false && angle < 0
        angle = angle + 2*pi;
    end
    vortex(j,k) = exp(1i*tp(q)*angle.^pow_fi);
    end
end
end
