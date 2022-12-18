% Author: Berkan Önder Karamelek
% KOM6202 Homework 2

function outimg = dilation(inimg, se)
    C = padarray(inimg,[0 1],1);
    outimg = false(size(inimg));
    for i=1:size(C,1)
        for j=1:size(C,2)-2
            outimg(i,j)=sum(se&C(i,j:j+2));
        end
    end
end