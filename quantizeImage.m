function outimg = quantizeImage(inimg, q); 

inimgNew = double(inimg);
[rowNumber,colNumber] = size(inimgNew);
outimg = zeros(rowNumber,colNumber);

for i = 1:rowNumber;
    for j = 1:colNumber;
        outimg(i,j) = inimgNew(i,j) / q;
    end
end

end
