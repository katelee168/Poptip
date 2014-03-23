%% Pass in a dataset of images, choose an image to view, (0,1) bw, and (0,1) plot

function [img] = view(data, image, bw, plot)

%build a random image specified by "image"
img = zeros(28,28);

for i = 1:28,
    for j = 1:28,
        img(i, j) = data(image,(i-1)*28+j);%this is with clean data
    end
end

if bw == 1
% take the image to b/w
    img = im2bw(img, 0.5);
end

if plot == 1
    imagesc(img)
end