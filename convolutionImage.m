% Author: Berkan Önder KARAMELEK
% Date: 16.04.2018
% convolution between image and filter
% 
% Explanation:
% convolution between two input image matrices
% image must be converted to double before use
% input : inimg (any dimensions) and filter (mxm square matrix)
% output: outimg

function outimg = convolutionImage(inimg,filter)
%     %rotate filter 180 degrees cw direction
%     data = 0; %data for swapping
%     posCount = size(filter,2); %record size of square filter matrix 
%     posCount2 = size(filter,2);%to calculate positions
%     
%     for i = 1:size(filter,1)-1
%         for j = 1:size(filter,2)-i + 1
%           %swapping data
%           data = filter(i,j);
%           filter(i,j) = filter(posCount2,posCount - j + 1);
%           filter(posCount2,posCount - j + 1) = data;
%         end
%         posCount2 = posCount2 - 1;
%     end
    
    %Convolution 
    %zero padding 
    nrp = size(filter,1);
    crp = size(filter,2);
    paddedImage = padImage(inimg,nrp,crp);
    centerx = nrp + 1;
    centery = crp + 1;
     
  for i = centerx:1:(nrp + size(inimg,1))
         for j = centery:1:(crp + size(inimg,2))
             sum = 0;
             for k = 1:size(filter,1)
                 for l = 1:size(filter,2)
                    sum = sum +  filter(k,l) * paddedImage(i-1+k,j-1+l);
                 end
             end
             paddedImage(i,j) = sum;
         end
  end
  outimg = cropImage(paddedImage,[size(filter,1)+1 size(filter,2)+1 size(paddedImage,1)-size(filter,1) size(paddedImage,2)-size(filter,2)]);
  outimg = uint8(outimg);
end
    
