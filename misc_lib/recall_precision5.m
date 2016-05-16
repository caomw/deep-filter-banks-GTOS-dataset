function [recall] = recall_precision5(Wtrue, Dhat)
%
% Input:
%    Wtrue = true neighbors [Ntest * Ndataset], can be a full matrix NxN
%    Dhat  = estimated distances
%
% Output:
%
%                  exp. # of good pairs inside hamming ball of radius <= (n-1)
%  precision(n) = --------------------------------------------------------------
%                  exp. # of total pairs inside hamming ball of radius <= (n-1)
%
%               exp. # of good pairs inside hamming ball of radius <= (n-1)
%  recall(n) = --------------------------------------------------------------
%                          exp. # of total good pairs 

for i=1:size(Dhat,1)
    [a,b] = sort(Dhat(i,:),'ascend');
    Wtrue(i,:) = Wtrue(i,b);
end
kkk=10;
total_good_pairs = size(Dhat,1)*kkk;%sum(Wtrue(:));

% for i=1:length(grid)
%     g = grid(i);
%     retrieved_good_pairs = sum(sum(Wtrue(:,1:g)));
%     recall(i) = retrieved_good_pairs/total_good_pairs;
% end

retrieved_good_pairs = sum(sum(Wtrue(:,1:kkk)));
recall = retrieved_good_pairs/total_good_pairs;




