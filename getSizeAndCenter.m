% Author: Berkan Önder Karamelek
% KOM6202 Homework 2 

function [area, xc, yc] = getSizeAndCenter(imbin)

    [h, v] = getProjections(imbin);
    
    % vertical
    areav = 0; % 109305
    for i=1:size(imbin,2)
        areav = areav + v(i);
    end

    % horizontal
    areah = 0; % 109305
    for i=1:size(imbin,1)
        areah = areah + h(i);
    end

    % center
    xc = 0; yc = 0;
    for i=1:size(imbin,2)
        xc = xc + i * v(i);
    end
    xc = floor(xc / areav); % 356

    for i=1:size(imbin,1)
        yc = yc + i * h(i);
    end
    yc = floor(yc / areah); %314

    area = areah;

    figure('Name', 'Center Point of the image')
    imshow(imbin)
    hold on
    plot(xc, yc, 'X',Color='g',LineWidth=8)
end