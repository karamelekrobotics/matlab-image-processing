function outimg = sampleImage(inimg,samplingRatio)

inimgNew = double(inimg);
[rowNumber,colNumber]=size(inimgNew);
outimg = zeros(rowNumber,colNumber);

for i = 1 : samplingRatio : rowNumber
 for j = 1 : samplingRatio : colNumber
     for k = 0 : samplingRatio - 1
         for l = 0 : samplingRatio - 1
             outimg(i+k,j+l)=inimgNew(i,j);
         end
     end
 end
end

% imshow(outimg)

end