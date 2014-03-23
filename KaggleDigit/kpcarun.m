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
eigs = 40;
[values, vectors, Ktr] = kpca(averages, eigs, 100);

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

%% Project reference kernel
y = [zeros(1,20) ones(1,20) (ones(1,20)*2)  (ones(1,20)*3) (ones(1,20)*4) (ones(1,20)*5) (ones(1,20)*6) (ones(1,20)*7) (ones(1,20)*8) (ones(1,20)*9)];
[b0, b1, b2, b3, b4, b5, b6, b7, b8, b9] = bootstrap(s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, 20, 100);

%combine into new dataset
averages = [b0; b1; b2; b3; b4; b5; b6; b7; b8; b9];
[avgDim, dim] = size(averages);

for i = 1:avgDim
    for j = 1:avgDim
        Kref(i,j) = kernel(averages(j,:), averages(i,:), 100);
    end
end

Xref = Kref*(vectors');

%% find min distance and return for each vector

D = zeros(30,avgDim);
for i = 1:30
    for j = 1:avgDim
        D(i,j) = norm(Xtt(i,:)-Xref(j,:));
    end
end

for i = 1:30
    [c,top] =  min(D(i,:));
    %for j = 1:avgDim
    %    if(D(i,j) < D(i,top))
     %for j = 1:eigs
     %    if(Xtt(i,j) > Xtt(i,top))
     %       top = j;
      %  end
    %end

    disp(['I think the ', num2str(i),'th image is ', num2str(y(top))]);
end
