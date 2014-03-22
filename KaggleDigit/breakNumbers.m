%% Pass in a dataset to break into images for individual numbers. Returns 10 matricies with images for each number
function [s0, s1, s2, s3, s4, s5, s6, s7, s8, s9] = breakNumbers(data)

[images, pixels] = size(data);

%initalize all the varaibles
s0 = zeros(1,pixels);
s1 = zeros(1,pixels);
s2 = zeros(1,pixels);
s3 = zeros(1,pixels);
s4 = zeros(1,pixels);
s5 = zeros(1,pixels);
s6 = zeros(1,pixels);
s7 = zeros(1,pixels);
s8 = zeros(1,pixels);
s9 = zeros(1,pixels);

for i = 1:images
    test = data(i,1);
    switch  test
        case 0
            s0 = [s0; data(i,:)];
        case 1
            s1 = [s1; data(i,:)];
        case 2
            s2 = [s2; data(i,:)];
        case 3
            s3 = [s3; data(i,:)];
        case 4
            s4 = [s4; data(i,:)];
        case 5
            s5 = [s5; data(i,:)];
        case 6
            s6 = [s6; data(i,:)];
        case 7
            s7 = [s7; data(i,:)];
        case 8
            s8 = [s8; data(i,:)];
        case 9
            s9 = [s9; data(i,:)];
    end
end

%get rid of the rows of zeros
s0 = s0(2:size(s0),:);
s1 = s1(2:size(s1),:);
s2 = s2(2:size(s2),:);
s3 = s3(2:size(s3),:);
s4 = s4(2:size(s4),:);
s5 = s5(2:size(s5),:);
s6 = s6(2:size(s6),:);
s7 = s7(2:size(s7),:);
s8 = s8(2:size(s8),:);
s9 = s9(2:size(s9),:);

