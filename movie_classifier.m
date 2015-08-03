function [ output_args ] = movie_classifier( trainfile, testfile )
% If 'trainfile.txt' and 'testfile.txt' are in the current directory, you can
% call this function by typing the following at the Matlab prompt:
% >>  movie_classifier('trainfile.txt', 'testfile.txt');

trainpairs = read_file(trainfile);

testpairs = read_file(testfile);

trainlabels = trainpairs.labels;
trNames = trainpairs.names;

testlabels = testpairs.labels;
testNames = testpairs.names;

kSize = size(testlabels,1);

featNames = [testNames trNames];

featSize = size(featNames,2);

features = GetFeatures(testNames, trNames);

testFeats = features(1:kSize,:);
trainFeats = features(kSize+1:featSize,:);

assert(~any(any(isnan(trainFeats))));
assert(~any(any(isnan(testFeats))));
assert(~any(any(isinf(trainFeats))));
assert(~any(any(isinf(testFeats))));

model = svmtrain(double(trainlabels),double(trainFeats), '-t 2');
[preds, acc, decval] = svmpredict(double(testlabels), double(testFeats), model);

display(acc)

end

