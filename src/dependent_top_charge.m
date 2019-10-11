function tp = dependent_top_charge(y,x, tp_input)
% this for functionally dependent topological charge
r1 = sqrt(y.^2 + x.^2);
syms r;
tp = double(subs(tp_input, r, r1));
end

