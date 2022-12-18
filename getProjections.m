% Author: Berkan Önder Karamelek
% KOM6202 Homework 2 

function [h,v] = getProjections(imbin)

    label = bwlabel(imbin);
    objectDet = (label==1);

    % Horizontal projection
    h = sum(objectDet, 2);

    % Vertical projection
    v = sum(objectDet, 1);
end