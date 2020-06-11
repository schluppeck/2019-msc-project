%% minimal MIP
%
% ds 2020-06 / msc projects

%% angio_brain - bet'ted angio scan.. for testing

fname = 'angio/angio_brain.nii';
d = niftiread(fname);
hdr = niftiinfo(fname);


%% get info about image
imDims = size(d);
pixDims = hdr.PixelDimensions;

%% use helper function to get MIPs
% check returnMIP.m and think about connections
% to code you wrote in class.

MIPs = {};

figure()
for theDim = 1:3
    MIPs{theDim} = returnMIP(d, theDim);
    
    im_{theDim} = subplot(1,3, theDim);
    
    imagesc(MIPs{theDim});
    % aspect ratio ... pixels aren't square
    switch theDim
        case 1
            pd = pixDims([2,3]);
        case 2
            pd = pixDims([1,3]);
        case 3
            pd = pixDims([1,2]);
        otherwise
            error('dimension not allowed')
    end
    daspect([pd , 1 ]) % data aspect ratio!
    
    title(sprintf('dim: %d', theDim))
    
end

colormap(gray)
