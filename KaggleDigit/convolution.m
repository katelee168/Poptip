%Convolution

%% Read in data
train = csvread('data/train.csv',1,0);
test = csvread('data/test.csv',1,0);

[testImages, testPixels] = size(test);

%% Break up data
[s0, s1, s2, s3, s4, s5, s6, s7, s8, s9] = breakNumbers(train);

%% Average data

averaged = zeros(10,testPixels);
averaged(10,:) = mean(s0,1);
averaged(1,:) = mean(s1,1);
averaged(2,:) = mean(s2,1);
averaged(3,:) = mean(s3, 1);
averaged(4,:) = mean(s4,1);
averaged(5,:) = mean(s5,1);
averaged(6,:) = mean(s6,1);
averaged(7,:) = mean(s7,1);
averaged(8,:) = mean(s8,1);
averaged(9,:) = mean(s9,1);

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
    