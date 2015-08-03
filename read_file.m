function pairs = read_file( filename )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
pairs = struct('labels', {}, 'names', {});

fTrainIn = fopen(filename, 'r');
C = textscan(fTrainIn,'%d %s','delimiter',',');

%C = textscan(fTrainIn, '%d %s');
fclose(fTrainIn);

trainLabels = C{1};
trainData = C{2};

for i=1:size(trainData,1)
    trainNames{i} = sprintf('posters/%s.jpg', trainData{i});
end

pairs = struct('labels', {trainLabels}, 'names', {trainNames});
temp = 1;
end

