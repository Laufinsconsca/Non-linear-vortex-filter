syms r; % for independent topological charge
n = 256; % size of image
R = 5; % define width of the split interval
r_hole = [0.15 0.2 0.25 0.75]; % the radius of the hole
r_d = [1 2 3]; % the radius of distance from the center of the hole
pow_fi = 1:0.5:2.5; % power of fi in exp(i*tp*fi)
tp = {3, r}; % tp can be either a constant or a function
isSymmetry = false; % symmetry with respect to the abscissa axis
step_of_angle_change = 15;
path = 'C:\input';

write_vortex_with_holes(path, tp, n, R, r_hole, r_d, pow_fi, isSymmetry, step_of_angle_change);
write_gauss_with_holes(path, n, R, r_hole, r_d, step_of_angle_change);

