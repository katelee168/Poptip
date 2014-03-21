%% Pass in a dataset to break into images for individual numbers. Returns 10 matricies with images for each number
function [zero, one, two, three, four, five, six, seven, eight, nine] = breakNumbers(data)

[images, pixels] = size(data);

%initalize all the varaibles
zero = zeros(1,pixels);
one = zeros(1,pixels);
two = zeros(1,pixels);
three = zeros(1,pixels);
four = zeros(1,pixels);
five = zeros(1,pixels);
six = zeros(1,pixels);
seven = zeros(1,pixels);
eight = zeros(1,pixels);
nine = zeros(1,pixels);

for i = 1:images
    test = data(i,1);
    switch  test
        case 0
            zero = [zero; data(i,:)];
        case 1
            one = [one; data(i,:)];
        case 2
            two = [two; data(i,:)];
        case 3
            three = [three; data(i,:)];
        case 4
            four = [four; data(i,:)];
        case 5
            five = [five; data(i,:)];
        case 6
            six = [six; data(i,:)];
        case 7
            seven = [seven; data(i,:)];
        case 8
            eight = [eight; data(i,:)];
        case 9
            nine = [nine; data(i,:)];
    end
end

%get rid of the rows of zeros
zero = zero(2:size(zero),:);
one = one(2:size(one),:);
two = two(2:size(two),:);
three = three(2:size(three),:);
four = four(2:size(four),:);
five = five(2:size(five),:);
six = six(2:size(six),:);
seven = seven(2:size(seven),:);
eight = eight(2:size(eight),:);
nine = nine(2:size(nine),:);

