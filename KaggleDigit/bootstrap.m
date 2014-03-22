%%creates bootstrapped versions of the dataset. Returns n "averages" for
%%each number provided.

function[b0, b1, b2, b3, b4, b5, b6, b7, b8, b9] = bootstrap(s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, n, m)

 %find the size
sizez = zeros(1,10);
[sizez(10), length] = size(s0);
[sizez(1), length] = size(s1);
[sizez(2), length] = size(s2);
[sizez(3), length] = size(s3);
[sizez(4), length] = size(s4);
[sizez(5), length] = size(s5);
[sizez(6), length] = size(s6);
[sizez(7), length] = size(s7);
[sizez(8), length] = size(s8);
[sizez(9), length] = size(s9);

%initalize everything
b0 = zeros(n,length);
b1 = zeros(n,length);
b2 = zeros(n,length);
b3 = zeros(n,length);
b4 = zeros(n,length);
b5 = zeros(n,length);
b6 = zeros(n,length);
b7 = zeros(n,length);
b8 = zeros(n,length);
b9 = zeros(n,length);

%generates n vectors
for j = 1:n
%take average of m random index
    for i = 1:m
        randomindex = rand(1,10);
        % make each random index span the number of images
        for k = 1:10
            randomindex(k) = int64(randomindex(k)*sizez(k)+1);
        end
        b0(j,:) = b0(j,:) + (s0(randomindex(10),:)/100);
        b1(j,:) = b1(j,:) + (s1(randomindex(1),:)/100);
        b2(j,:) = b2(j,:) + (s2(randomindex(2),:)/100);
        b3(j,:) = b3(j,:) + (s3(randomindex(3),:)/100);
        b4(j,:) = b4(j,:) + (s4(randomindex(4),:)/100);
        b5(j,:) = b5(j,:) + (s5(randomindex(5),:)/100);
        b6(j,:) = b6(j,:) + (s6(randomindex(6),:)/100);
        b7(j,:) = b7(j,:) + (s7(randomindex(7),:)/100);
        b8(j,:) = b8(j,:) + (s8(randomindex(8),:)/100);
        b9(j,:) = b9(j,:) + (s9(randomindex(9),:)/100);
    end
end


    