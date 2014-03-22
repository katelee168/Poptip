%%kpcarun, uses kpca.m to generate the model of eigenvectors/values then
%%projects onto them the new testing data.

%% Read in data
train = csvread('data/train.csv',1,0);
test = csvread('data/test.csv',1,0);

[testImages, dim] = size(test);
[N, discarded] = size(train);

%% create new dataset of averages


%% build eigenvectors/values
[values, vectors, K] = kpca(train(:,2:testPixels+1));

%% project test values


for i = 1:1%testImages
    for j = 1:N
        kernelize = kernel(train(j,:), train(i,:));
    end
    y = values'*(eye(N)-ones(N)/N)*(kernelize-K*(ones(N)/N));
end