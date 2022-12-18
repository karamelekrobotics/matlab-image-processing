% Author: Berkan Önder KARAMELEK
% Date: 18.04.2018 21:29
% Sobel Operator
% 
% Explanation:
% input : ininmg : image matrix (any dimensions)      
% output: outimg, Sobel prcessing applied image
%         theta, actual directions of the gradients
function [outimg,theta] = sobelOpImage(inimg)
   
    inimg = double(inimg);
%     prelocation for speed
    outimg = size(inimg);
    theta = size(inimg);
    
    for i = 1:size(inimg,1)-2
        for j = 1:size(inimg,2)-2
            Gx = (2*inimg(i+2,j+1) + inimg(i+2,j) + inimg(i+2,j+2)) - (2*inimg(i,j+1) + inimg(i,j) + inimg(i,j+2));
            Gy = ((2*inimg(i+1,j+2)+inimg(i,j+2)+inimg(i+2,j+2))-(2*inimg(i+1,j)+inimg(i,j)+inimg(i+2,j)));
        
            outimg(i,j)=sqrt(Gx.^2+Gy.^2);
            theta(i,j) = round((atan2(Gx,Gy) * 180 / pi)/45)*45;
        end
    end
    outimg = uint8(outimg);
    
end