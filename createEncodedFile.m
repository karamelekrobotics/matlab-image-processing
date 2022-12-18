% Author: Berkan Önder Karamelek
% KOM6202 Homework 2 

function [] = createEncodedFile(imbin, fileName)
    label = bwlabel(imbin);
    objectDet = (label==1);
    m = size(label,1);
    n = size(label,2);
    % encdode binary image by runnig runlen.m and print encoded values
    % as comma separeated with ending new line
    fp = fopen(fileName,'wt');
    for i=1:m
        out = runlen(label(i,:)); % Call user defined encoding function
        for j=1:length(out)
            fprintf(fp, "%d", out(j));
            if j ~= length(out)
                fprintf(fp, ",");
            end
        end
        fprintf(fp, "\n");
    end
    fclose(fp);
end