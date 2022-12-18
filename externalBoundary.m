% Author: Berkan Önder Karamelek
% KOM6202 Homework 2

function outimg = externalBoundary(inimg,se)
    dilated = dilation(inimg,se);
    outimg  = dilated - inimg;
    figure('Name','External Bondary using Morph. Ops.')
    imshow(outimg)
end