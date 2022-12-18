function outimg = powerlawtransform(inimg, power);

inimgNew = im2double(inimg);
[rowNumber,colNumber] = size(inimgNew);
outimg = zeros(rowNumber,colNumber);
c = 1;
    for i = 1:rowNumber
        for j = 1:colNumber
            outimg(i,j) = c * inimgNew(i,j) ^ power;
        end
    end
    
% imshow(outimg)

end