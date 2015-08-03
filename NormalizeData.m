function trainfeats = NormalizeData( feats )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
stdDev = std(feats);
m = mean(feats);
trainfeats = (feats-repmat(m,size(feats,1),1))./repmat(stdDev, size(feats,1),1);

% mmin = min(feats(:));
% mmax = max(feats(:));
% trainfeats = (feats-mmin) ./ (mmax-mmin);
% 
% normA = max(feats) - min(feats);               % this is a vector
% normA = repmat(normA, size(feats,1),1);  % this makes it a matrix
%                                        % of the same size as A
% trainfeats = feats./normA;  % your normalized matrix
end

