% Author: Berkan Önder KARAMELEK
% Date: 16.04.2018 23:14
% filtering image matrix
% 
% Explanation:
% input : ininmg : image matrix (any dimensions)
%         filter matrix
% output: outimg, filtered image matrix

function outimg = filterImage(inimg,filter)
   
    inimg = double(inimg);
    outimg = convolutionImage(inimg,filter);
    outimg = uint8(outimg);
    
end