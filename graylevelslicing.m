function outimg = graylevelslicing(inimg, beginingPoint, finishPoint);

inimgNew = double(inimg);
[rowNumber,colNumber] = size(inimgNew);
outimg = zeros(rowNumber,colNumber);

for i = 1:rowNumber;
    for j = 1:colNumber;
        if (inimgNew(i,j) >= beginingPoint) && (inimgNew(i,j) <= finishPoint)
            outimg(i,j) = 255;
        else
            outimg(i,j) = 0;
        end
    end
end

% imshow(outimg)

end
 
