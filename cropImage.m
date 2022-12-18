% Author: Berkan Önder KARAMELEK
% Date: 16.04.2018 15:29
% cropping zeros image matrix
% 
% Explanation:
% input : ininmg : image matrix (any dimensions) and cropArray 
% 
% output: outimg, cropped nrp x crp
function outimg = cropImage(inimg,cropArray)
        
    upperLeft = cropArray(1:2);
    lowerRight = cropArray(3:4);
    data = zeros(1,(upperLeft(1,2)-lowerRight(1,2)));
    c = 1;
    for i = upperLeft(1,1):lowerRight(1,1)
        m = 1;
        for j = upperLeft(1,2):lowerRight(1,2)
            data(m) = inimg(i,j);
            m = m + 1;
        end
        outimg(c,:) = data;
        c = c + 1;
    end
    outimg = uint8(outimg);
  
end
