% Author: Berkan Önder Karamelek
% KOM6202 Homework 2

function outimg = erosion(inimg, se)

    C = padarray(inimg,[0 1],1);
    outimg = false(size(inimg));

    for i=1:size(C,1)

        for j=1:size(C,2)-2
            L = C(i,j:j+2);
            K = find(se==1);
            if(L(K) == 1)
                outimg(i,j)=1;
            end
        end
    end
end