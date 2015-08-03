function trainFeats = GetFeatures( testNames, trNames )
%Extract the features of the images
curDir = pwd;
trainFeats = [];
names = [testNames trNames];
%computes the vocabulary.
vocabulary = computeVocabularyFromImageList(names);
for i=1:size(names,2)
    img1 = imread(fullfile(curDir,names{1,i}));
    im = double(img1);

    % Parameters:
    clear param
    param.imageSize = [400 400]; % it works also with non-square images
    param.orientationsPerScale = [8 8 8 8];
    param.numberBlocks = 4;
    param.fc_prefilt = 4;

    % Computing gist requires 1) prefilter image, 2) filter image and collect
    % output energies
    [gist1, param] = LMgist(img1, '', param);
    %extract PHOW fetaures
    imstd = standardizeImage(img1) ;
    [keypoints, descriptors] = vl_phow(imstd, 'step', 4, 'floatdescriptors', true,'color','rgb') ;
    
    %extract a subset of the features
    vlDes = vl_colsubset(descriptors, round(10000 / numel(names)), 'uniform') ;
    vlDescrs(i,:)= reshape(vlDes,1,size(vlDes,1)*size(vlDes,2));
    
    gistFeats(i,:) = gist1;
    width = size(img1,2) ;
    height= size(img1,1) ;
    [keypoints, descriptors] = computeFeatures(img1) ;
    words = quantizeDescriptors(vocabulary, descriptors) ;
    histogram = computeHistogram(width, height, keypoints, words) ;
    trainFeats(i,:) = histogram';
    
end
%normalize the data
gistNorm = NormalizeData(gistFeats);
featsNorm = NormalizeData(vlDescrs);
trainFeats = [trainFeats gistNorm featsNorm];

end

