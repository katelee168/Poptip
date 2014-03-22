%Convolution

%% Read in data
train = csvread('data/train.csv',1,0);
test = csvread('data/test.csv',1,0);

[testImages, testPixels] = size(test);

%% Break up data
[zeros, ones, twos, threes, fours, fives, sixs, sevens, eights, nines] = breakNumbers(train);

%% Average data

averaged = zeros(10,testPixels);
averaged(10,:) = mean(zeros,1);
averaged(1,:) = mean(ones,1);
averaged(2,:) = mean(twos,1);
averaged(3,:) = mean(threes, 1);
averaged(4,:) = mean(fours,1);
averaged(5,:) = mean(fives,1);
averaged(6,:) = mean(sixs,1);
averaged(7,:) = mean(sevens,1);
averaged(8,:) = mean(eights,1);
averaged(9,:) = mean(nines,1);

%% Convolute
%pick an image
img = test(1,:);

%% Convolute with each image

cval = zeros(1,10);
max = 0;
maxIndex = 0;
for i 1:10
    cval(i) = mea(xcorr(img, averaged(i,:)),2);
    if (cval(i)>max)
        maxIndex = i;
    end
end

maxIndex
    