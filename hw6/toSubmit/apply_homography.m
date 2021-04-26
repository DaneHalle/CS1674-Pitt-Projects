function [p2] = apply_homography(p1, H)
    p = H * [p1; ones(1, size(p1, 2))];
    w = p(3,:);
    p2 = [(p(1,:)./w); (p(2,:)./w)];
end