syms r; % for independent topological charge
R = 5; % define width of the split interval
r_hole = 0.3;
n = 1024; % size of image
pow_fi = 1; % power of fi in exp(i*tp*fi)
tp = r; % tp can be either a constant or a function
isSymmetry = false; % symmetry with respect to the abscissa axis
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
vortex = create_hole(vortex, R, 2, pi/3, r_hole); % create hole
% ----------------------------------------------------------
imshow(vortex, [0 255]);
char_tp = 'r^0.8';
%imwrite(vortex, gray(256), strcat('C:\Users\Валентин\Desktop\for_presentation\3_fi=1_m=-10\top_charge_',char_tp,'_r0=',num2str(r1),'_fi=',num2str(pow_fi),'.bmp'), 'bmp');
