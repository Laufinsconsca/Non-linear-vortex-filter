function [] = write_gauss_with_holes(path, n, R, r_hole_input, r_d_input, step_of_angle_change)
sigma = 4;
hx = 2*R/n;
x = -R:hx:(R-hx);
f = gauss(x, sigma).';
g = gauss(x, sigma).';

a = f*g.';

f_max = max(max(abs(a)));

vortex = zeros(n,n);
c_arg = zeros(n,n);

for j = 1:n
    for k = 1:n
        vortex(j,k) = abs(a(j,k))*255/f_max; 
        t = atan2(imag(a(j,k)),real(a(j,k)));
        c_arg(j,k) = t*255/(2*pi); 
        if t < 0
        c_arg(j,k) = c_arg(j,k) + 255;
        end
    end
end

folder = strcat(path, '\gauss');
mkdir(folder);
imwrite(vortex, gray(256), strcat(folder,'\gauss.bmp'), 'bmp');

for r_d = r_d_input
for r_hole = r_hole_input
for i = 1:(360/step_of_angle_change)
temp = vortex;
fi = i*step_of_angle_change;
vortex = create_hole(vortex, R, r_d, fi*2*pi/360, r_hole);
folder = strcat(path, '\gauss\r_d=',num2str(r_d),'\r_hole=',num2str(r_hole),'\fi=',num2str(fi));
mkdir(folder);
imwrite(vortex, gray(256), strcat(folder, '\r_d=',num2str(r_d),',r_hole=',num2str(r_hole),',fi=',num2str(fi),'.bmp'), 'bmp');
vortex = temp;
end
end
end
end

