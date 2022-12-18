% Author: Berkan Önder KARAMELEK
% Date: 16.04.2018 23:34
% order statistics filtering image matrix
% 
% Explanation:
% input : ininmg : image matrix (any dimensions)
%         filterSize
%         typeOfStatistics: 1: Median
%                           2: Max
%                           3: Min
% output: outimg, filtered image matrix

function outimg = orderStFiltering(inimg,filterSize,typeOfStatistics)
   
    outimg = double(inimg);
    filter = ones(filterSize(1,1),filterSize(1,2)); % optional, not necesssary
   
    nrp = filterSize(1,1); centerx = nrp + 1;
    crp = filterSize(1,2); centery = crp + 1;
    paddedIm = padImage(outimg,nrp,crp);
   
%     keep procees faster by allocating space before starts
    medianVec = zeros(1,filterSize(1,1)*filterSize(1,2));
    maxVec = zeros(1,filterSize(1,1)*filterSize(1,2));
    minVec = zeros(1,filterSize(1,1)*filterSize(1,2));

    if typeOfStatistics == 1
        for i = centerx:1:(nrp + size(inimg,1))
          for j = centery:1:(crp + size(inimg,2))
            m = 1;
            for k = 0:size(filter,1)-1
                 for l = 0:size(filter,2)-1
                    medianVec(m) =  paddedIm(i-1+k,j-1+l);
                    m = m + 1;
                 end
            end
             paddedIm(i,j) = median(medianVec);
          end
        end
        outimg = uint8(paddedIm);
    elseif typeOfStatistics == 2
         for i = centerx:1:(nrp + size(inimg,1))
          for j = centery:1:(crp + size(inimg,2))
            m = 1;
            for k = 0:size(filter,1)-1
                 for l = 0:size(filter,2)-1
                    maxVec(m) =  paddedIm(i-1+k,j-1+l);
                    m = m + 1;
                 end
            end
             paddedIm(i,j) = max(maxVec);
          end
         end
         outimg = uint8(paddedIm);
    elseif typeOfStatistics == 3
        for i = centerx:1:(nrp + size(inimg,1))
          for j = centery:1:(crp + size(inimg,2))
            m = 1;
            for k = 0:size(filter,1)-1
                 for l = 0:size(filter,2)-1
                    minVec(m) =  paddedIm(i-1+k,j-1+l);
                    m = m + 1;
                 end
            end
             paddedIm(i,j) = min(minVec);
          end
        end
        outimg = uint8(paddedIm);      
    else
        fprintf('Error: There is no typeOfStatistics you entered...\n');
    end
  
end