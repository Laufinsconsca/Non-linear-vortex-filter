syms r; % for independent topological charge
r1 = 5; % define width of the split interval 
n = 512; % size of image
pow_fi = 2; % power of fi in exp(i*tp*fi)
% ----------------------------------------------------------
% tp is a topological charge (can be either a constant or a function)
% ----------------------------------------------------------
% range of r1, which define width of the split interval
for r1=1:0.5:5
% ----------------------------------------------------------
    for i=1:7
        switch i
            case 1
                tp = r;
            case 2
                tp = r.^2;
            case 3
                tp = r.^3;
            case 4
                tp = r.^0.5;
            case 5 
                tp = 1.5.^r;
            case 6
                tp = exp(r);
            case 7
                tp = log(r);
       end
       % ----------------------------------------------------------
       % range of power of fi
       for pow_fi=0.5:0.5:3
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
       char_tp = char(tp);
       % ----------------------------------------------------------
       % renaming is required because there is no support for the slash character in the folder name
       if i == 4
           char_tp = 'r^0.5';
       end
       if i == 5
           char_tp = '1.5^r';
       end
       % ----------------------------------------------------------
       % write image on local drive
       imwrite(vortex, gray(256), strcat('images\512\top_charge_',char_tp,'_r0=',num2str(r1),'_fi=',num2str(pow_fi),'.bmp'), 'bmp');
       end
    end
end
