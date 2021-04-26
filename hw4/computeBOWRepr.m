function [bow_repr] = computeBOWRepr(features, means)
    bow_repr = zeros(1,size(means,1));
    
    check = pdist2(features, means);
    mapped = zeros(size(features,1),1);
    for i = 1:size(check,1)
        highest = 1;
        for j = 1:size(check, 2)
            if check(i,highest) > check(i,j)
                highest = j;
            end
        end
        mapped(i) = 1;
        bow_repr(highest) = bow_repr(highest)+1;
    end
    
    
    
    for i = 1:size(bow_repr,1)
        bow_repr(i,:) = bow_repr(i,:) / sum(bow_repr(i,:));
    end
end