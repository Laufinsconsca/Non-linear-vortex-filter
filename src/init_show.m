syms r; % for independent topological charge
r1 = 5; % define width of the split interval 
n = 512; % size of image
pow_fi = 1; % power of fi in exp(i*tp*fi)
tp = r; % tp can be either a constant or a function
% ----------------------------------------------------------
% tp is a topological charge
% ----------------------------------------------------------
% formation matrix of pixels
vortex = 255*angle(vortex_filter(r1, n, pow_fi, tp))/(2*pi);
for j=1:size(vortex,1)
	for k=1:size(vortex,2)
        if vortex(j,k) < 0
            vortex(j,k) = vortex(j,k) + 255;
        end
	end
end
% ----------------------------------------------------------
imshow(vortex, [0 255]);
