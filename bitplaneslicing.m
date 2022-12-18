function outimg = bitplaneslicing( inimg, bitplaneNumber);

inimgNew = double(inimg);
[rowNumber,colNumber] = size(inimgNew);
outimg = zeros(rowNumber,colNumber);

 for i = 1:rowNumber;
      for j = 1:colNumber;
          bin = de2bi(inimgNew(i,j));
          outimg(i,j) = 2 ^ bitplaneNumber * bin(bitplaneNumber);
      end
 end
  imshow(outimg)
end

