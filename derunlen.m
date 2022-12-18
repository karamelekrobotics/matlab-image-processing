% Author: Berkan Önder Karamelek
% KOM6202 Homework 2 

function [imDecoded] = derunlen(imbin, fileName)
    label = bwlabel(imbin);
    objectDet = (label==1);

    m = size(label,1);
    n = size(label,2);
    imDecoded = zeros(m,n);
    
    % decode encoded image, first read encoded file
    fp = fopen(fileName,'rt');
    % lines = fgetl(fp); %test purpose
    % size(lines) %test purpose
    
    j=1; % hold encodedDat matrix row index 
    idx = 1; % holds column index of the image that will be decode
    
    % read file until EOF reached
    while true
        lines = fgetl(fp); % get one line to process
        if ~ischar(lines) % if EOF break
            break;
        end
    
        lines2 = strsplit(lines,[","]); %split each str, data was separeted by comma
        
        % store freq of 1s and 0s inside encodedDat
        for i=1:length(lines2)
            encodedDat(j,i) = str2double(lines2(1,i));
        end
    
        % kc will be used to distinguish 0 start and 1 start row
        kc = 1;
        if encodedDat(j,1) == 0 
            kc = 2;
        else
            kc = 1;
        end
       
        % start decoding
        for k=kc:length(encodedDat(j,:))
            if (mod(k,2) == 0) % check position and frequencies
                for l=1:encodedDat(j,k)
                    imDecoded(j,idx) = 0; %store
                    idx = idx + 1; % go to next column index
                end
            else
                for l=1:encodedDat(j,k)
                    imDecoded(j,idx) = 1; %store
                    idx = idx + 1; % go to next column index
                end
            end    
        end
        j = j + 1; % process next row of encodedDat
        idx = 1; % reset column index
    end
    
    figure ('Name','Decoded from encoded.text'),
    imshow(imDecoded)
end