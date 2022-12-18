function [histogramValues, outImg]= histogramEqualization (inimg);
%this function is based on my implementation

inimgNew = double(inimg);

RowNumber = size(inimgNew,1);
ColNumber = size(inimgNew,2);

HistOfIm = uint8(zeros(RowNumber,ColNumber));

%number of pixels will be...
n = RowNumber * ColNumber;

%frequency, column vector, 256 different gray level
f = zeros(256,1);

%another column vector for prob den func. and cum dist func.
pdf = zeros(256,1);
cdf = zeros(256,1);

Cum = zeros(256,1);
outimg = zeros(256,1);

for i = 1: RowNumber
    for j = 1: ColNumber
        Value = inimgNew(i,j);
        f(Value + 1) = f(Value + 1) +  1;
        pdf(Value + 1) = f(Value + 1) / n;
    end
end

histogramValues = f;

Sum = 0;
L = 127; %256 - 1 == L - 1 actually

for i = 1:size(pdf)
    Sum = f(i);
    Cum(i) = Sum;
    cdf(i)  = Cum(i) / n; %normalize
    outimg(i) = round(cdf(i) * L);
end

for i =1: RowNumber
    for j = 1: ColNumber
        HistOfIm(i,j) = outimg(inimgNew(i,j) + 1);
    end
end

outImg = HistOfIm;
% imshow(HistOfIm)
imshow(outImg)


