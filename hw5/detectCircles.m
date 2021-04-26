function [centers] = detectCircles(im, edges, radius, top_k)

    H = zeros(size(im,1), size(im,2));

    for i = 1:size(edges,1)
        a = edges(i, 1) - radius*cosd(edges(i,4));
        b = edges(i, 2) - radius*sind(edges(i,4));
        
        a = ceil(a);
        b = ceil(b);
        if a < 1 || b < 1 || a > size(im,1) || b > size(im,2)
            continue
        end
        H(a, b) = H(a, b)+1;
    end
    centers = zeros(top_k, 2);
    for i = 1:top_k
        val = max(max(H));
        [r, c] = find(H==val);
        H(r(1), c(1)) = 0;
        
        centers(i,1) = r(1);
        centers(i,2) = c(1);
    end    
    
    figure;
    imshow(im)
    viscircles(centers, radius*ones(size(centers,1), 1));
%     title("Radius of 30");
%     saveas(gcf, 'jupiter_circles.png');
end