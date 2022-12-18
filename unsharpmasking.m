% Author: Berkan Önder KARAMELEK
% Date: 17.04.2018 18:52
% unsharp masking
% 
% Explanation:
% input : ininmg : image matrix (any dimensions)
%                  filter matrix
%                  scale k
% output: outimg, unsharpmasked image matrix
function outimg = unsharpmasking(inimg,lowpassFilter,k)
   
    outimg = convolutionImage(double(inimg),lowpassFilter);

    outimg = double(outimg);  
    outimg = outimg .* k;

    outimg = double(inimg) - outimg;
    outimg = outimg .* 9;
    
    outimg = uint8(outimg);
end