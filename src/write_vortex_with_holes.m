function [] = write_vortex_with_holes(path, tp_input, n, R, r_hole_input, r_d_input, pow_fi_input, isSymmetry, step_of_angle_change)
for tp_i = 1:size(tp_input, 2)
    tp = cell2char(tp_input(tp_i));
for pow_fi = pow_fi_input
% ----------------------------------------------------------
% tp is a topological charge
% ----------------------------------------------------------
% formation matrix of pixels
vortex = 255*angle(vortex_filter(R, n, pow_fi, tp, isSymmetry))/(2*pi);
for j=1:size(vortex,1)
    for k=1:size(vortex,2)
        if vortex(j,k) < 0
        vortex(j,k) = vortex(j,k) + 255;
        end
    end
end
% ----------------------------------------------------------
% create reference vortex
folder = strcat(path, '\tp=', tp, '\pow_fi=', num2str(pow_fi));
mkdir(folder);
imwrite(vortex, gray(256), strcat(folder,'\tp=',tp,',pow_fi=',num2str(pow_fi),'.bmp'), 'bmp');
% ----------------------------------------------------------
% create vortex with holes
for r_d = r_d_input
for r_hole = r_hole_input
for i = 1:(360/step_of_angle_change)
temp = vortex;
fi = i*step_of_angle_change;
vortex = create_hole(vortex, R, r_d, fi*2*pi/360, r_hole); % create a set of holes
folder = strcat(path, '\tp=', tp, '\pow_fi=',num2str(pow_fi),'\r_d=',num2str(r_d),'\r_hole=',num2str(r_hole),'\fi=',num2str(fi));
mkdir(folder);
imwrite(vortex, gray(256), strcat(folder, '\tp=', tp,',pow_fi=',num2str(pow_fi),',r_d=',num2str(r_d),',r_hole=',num2str(r_hole),',fi=',num2str(fi),'.bmp'), 'bmp');
vortex = temp;
end
end
end
end
end
end

