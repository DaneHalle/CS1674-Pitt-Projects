
function [energyImage, Ix, Iy] = energy_image(im)
    gray = rgb2gray(im);
    filterx = [-1,1];
    filtery = [-1;1];
    Ix = double(imfilter(gray, filterx, 'conv', 'replicate'));
    Iy = double(imfilter(gray, filtery, 'conv', 'replicate'));
    energyImage = sqrt(Ix.^2 + Iy.^2);
end