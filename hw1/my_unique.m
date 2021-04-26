% 11
function [N] = my_unique(M)
    toAdd = zeros(size(M));
    pos = 1;
    for r = 1:size(M)
        flag = true;
        for added = 1:pos
            M(r,:)
            if isequal(M(r,:), toAdd(added,:))
                flag = false;
            end
        end
        if flag
            toAdd(pos,:) = M(r,:);
            pos = pos+1;
        end
    end
    N = zeros(pos-1, size(M,2));
    for rT = 1:pos-1
        N(rT,:) = toAdd(rT,:);
    end
end