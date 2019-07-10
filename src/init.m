r = 5; % define width of the split interval 
n = 800; % size of image
pow_fi = 2; % power of fi in exp(i*tp*fi)
tp = 5; % topological charge (for independent topological charge)
% ----------------------------------------------------------
% if the count of input arguments is 4 then tp = const, else if 3 then tp = tp(r)
vortex = vortex_filter(r, n, pow_fi);
% ----------------------------------------------------------
vortex = 255*angle(vortex)/(2*pi);
for j=1:size(vortex,1)
    for k=1:size(vortex,2)
        if vortex(j,k) < 0
            vortex(j,k) = vortex(j,k) + 255;
        end
    end
end
% ----------------------------------------------------------
imshow(vortex, [0 255]);


