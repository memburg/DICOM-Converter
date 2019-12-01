% dcmconvert as its name says, converts DICOM files
% to another image file, all of this given a set of
% DICOM images.
function [] = dcmconvert(src, dest, ext)
fp = fullfile(src, '*.dcm');
fs = dir(fp);

for i = 1: length(fs)
    bn = fs(i).name;
    fn = fullfile(src, bn);
    im = dicomread(fn);
    im = uint8(255 * mat2gray(im));
    finalname = '';
    
    % if statement can be modified in order
    % to change the image name, depending on
    % how big the image set is
    if i < 10
        finalname = strcat(dest, '00');
        finalname = strcat(finalname, int2str(i));
        finalname = strcat(finalname, ext);
    elseif i >= 10 && i < 100
        finalname = strcat(dest, '0');
        finalname = strcat(finalname, int2str(i));
        finalname = strcat(finalname, ext);
    else
        finalname = strcat(dest, int2str(i));
        finalname = strcat(finalname, ext);
    end
    
    imwrite(im, finalname);
end
end