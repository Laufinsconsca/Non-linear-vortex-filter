function vortex = create_hole(vortex, R, r, fi, r_hole)
fi = fi + pi/2;
n = size(vortex,1);
h = 2*R/n;
t_cos = (n + cos(fi)*r*n/R)/2;
t_sin = (n + sin(fi)*r*n/R)/2;
%---------------------------------------------------
for j = round(t_cos - r_hole*n/R) : round(t_cos + r_hole*n/R)
    for k = round(t_sin - r_hole*n/R) : round(t_sin + r_hole*n/R)
        if (j-t_cos)^2 + (k-t_sin)^2 < r_hole*r_hole*n*n/(R*R)
        vortex(j,k) = 0;
    end
end
end

