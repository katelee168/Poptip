train = csvread('data/train.csv',1,0);
test = csvread('data/test.csv',1,0);

[testImages, testPixels] = size(test);
[trainImages, trainPixels] = size(train);

cleanTrain = train(:,2:trainPixels);

clear train

train = cleanTrain;

clear cleanTrain;