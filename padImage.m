% Author: Berkan Önder KARAMELEK
% Date: 16.04.2018 04:57
% zero padding to image matrix
% 
% Explanation:
% input : ininmg : image matrix (any dimensions) and nrc row number
% crp column number
% output: outimg, padded by zeros as nrp x crp

function outimg = padImage(inimg,nrp,crp)
    outimg = zeros(size(inimg,1)+2*nrp,size(inimg,2)+2*crp);
    for i = nrp+1:nrp+size(inimg,1) 
        for j = crp+1:crp+size(inimg,2)
                outimg(i,j) = inimg(i-nrp,j-crp);
        end
    end
    
end
