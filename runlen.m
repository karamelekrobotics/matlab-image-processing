% Author: Berkan Önder Karamelek
% KOM6202 Homework 2 

function [out] = runlen(array)
    freqIndx = 1;
    ones = 0; zeros = 0; flag = 1;
    count = 1;
    for i=1:size(array,2)-1
        out(freqIndx) = count;
        if array(i) == array(i + 1)
           count = count + 1;
           out(freqIndx)  = count;
        else
            count = 1;
            freqIndx = freqIndx + 1;
        end
    end
   
    if array(1) == 0
        out = [0 out(1:end)];
    end
end