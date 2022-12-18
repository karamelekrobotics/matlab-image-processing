% Author: Berkan Önder Karamelek
% KOM6202 Homework 2 

function imsign = getSigniture(imbin)
    label = bwlabel(imbin);
    objectDet = (label==1);

    bwf = imfill(label,'holes');

    imsign = zeros(size(bwf));
    [B, L] = bwboundaries(bwf,'noholes');
    
    for i=1:length(B)
        b2 = B{i};
        for j=1:size(b2,1)
            imsign(b2(j,1), b2(j,2)) = 1;
        end
    end
    
    figure ('Name','image signiture'),
    imshow(bwf)
    hold on
    imshow(imsign)
end