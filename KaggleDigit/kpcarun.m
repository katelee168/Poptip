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
[avgDim, dim] = size(averages);
%% build eigenvectors/values
[values, vectors, Ktr] = kpca(averages, 10, 100);

%% project test values
% test kernel matrix
subTest = test(1:30,:);
Ktt = zeros(30,avgDim);

for i = 1:30
    for j = 1:avgDim
        Ktt(i,j) = kernel(averages(j,:),subTest(i,:),100);
    end
end

Xtt = Ktt*(vectors');

%% find max and return for each vector

for i = 1:30
    top = 1;
    for j = 1:10
        if(Xtt(i,j) < Xtt(i,top))
            top = j;
        end
    end
    disp(['I think the ', num2str(i),'th image is ', num2str(top)]);
end
