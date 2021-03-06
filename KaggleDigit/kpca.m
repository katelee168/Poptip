%%pass in train and receive the eigenvalues + their corresponding
%%eigenvectors for the train. Here we use a gaussian kernel.

%%train is a (nxm) matrix with n trainpoints that have m dimensions each

%%implementation inspired by Olsson 2013 (Kernel Principal Component
%%analysis: applications, implementation, and comparison), http://www.umiacs.umd.edu/labs/cvl/pirl/vikas/projects/cmsc878r_proj_slides_3.pdf
%%and 

function[values, vectors, Ktr] = kpca(train, eigs, sigma) 

[N, dim] = size(train);

% recenter
for i = 1:N
    train(i,:) = train(i,:)-mean(train(i,:));
end

%train kernel matrix
Ktr = zeros(N, N);

for i = 1:N
    for j = 1:N
        Ktr(i,j) = kernel(train(j,:),train(i,:),sigma);
    end
end

% modified gram matrix
Ktilde = (eye(N) - (ones(N,N)/N))'*Ktr*(eye(N) - (ones(N,N)/N));

% eigenvectors
[eigenvectors, D] = eig(Ktilde);

% pull off eigenvalues
eigenvalues = sum(D,2);

% normalize eigenvectors
eigenvectors = normc(eigenvectors);

% pull off max eigenvalues/vectors
%top = zeros(1,dim);
values = zeros(1,eigs);
vectors = zeros(eigs,N);
for i = 1:eigs
    top = 1;
    for j = 1:size(eigenvalues)
        if(eigenvalues(top) < eigenvalues(j))
            top = j;
        end
    end
    values(i) = eigenvalues(top);
    vectors(i,:) = eigenvectors(top,:);
    eigenvalues(top) = 0;
end