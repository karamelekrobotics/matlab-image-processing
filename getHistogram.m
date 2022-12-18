function [histogramValues]= getHistogram (inimg);

inimgNew = double(inimg);
freq = zeros(256,1);
[rowNumber,colNumber] = size(inimgNew);

x = 0:1:255;

for i = 1:rowNumber;
    for j = 1:colNumber;
        Value = inimgNew(i,j);
        freq(Value + 1) = freq(Value + 1) + 1;
    end
end


figure 
bar(x,freq)
axis([0 256 0 9000]);

end