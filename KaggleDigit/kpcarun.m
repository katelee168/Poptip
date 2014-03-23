%%kpcarun, uses kpca.m to generate the model of eigenvectors/values then
%%projects onto them the new testing data.

%% Read in data
% use read.m

[testImages, dim] = size(test);
[N, discarded] = size(train);

%% create new dataset of averages
[b0, b1, b2, b3, b4, b5, b6, b7, b8, b9] = bootstrap(s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, 20, 100);

%combine into new dataset
averages = [b0; b1; b2; b3; b4; b5; b6; b7; b8; b9];
%% build eigenvectors/values
[values, vectors, K] = kpca(averages);

%% project test values

for i = 1:1%testImages
    for j = 1:N
        kernelize = kernel(train(j,:), train(i,:),1);
    end
    y = values'*(eye(N)-ones(N)/N)*(kernelize-K*(ones(N)/N));
end