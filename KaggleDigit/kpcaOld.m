%%pass in train and receive the eigenvalues + their corresponding
%%eigenvectors for the train. Here we use a gaussian kernel.

%%train is a (nxm) matrix with n trainpoints that have m dimensions each

%%implementation inspired by Olsson 2013 (Kernel Principal Component
%%analysis: applications, implementation, and comparison), http://www.umiacs.umd.edu/labs/cvl/pirl/vikas/projects/cmsc878r_proj_slides_3.pdf
%%and 

function[eigenvalues, eigenvectors, K] = kpca(train, test, dim) 

[N, dim] = size(train);
[n, dim] = size(test);

% recenter
for i = 1:N
    train(i,:) = train(i,:)-mean(train(i,:));
end

% gaussian gram matrix
K = zeros(N, N);

for i = 1:N
    for j = 1:N
        K(i,j) = kernel(train(i,:),test(j,:),1);
    end
end

% modified gram matrix
Ktilde = (eye(N) - (ones(N,N)/N))'*K*(eye(N) - (ones(N,N)/N));

% eigenvectors
[eigenvectors, D] = eig(Ktilde);

% pull off eigenvalues
eigenvalues = sum(D,2);


% normalize eigenvectors
eigenvectors = normc(eigenvectors);

end