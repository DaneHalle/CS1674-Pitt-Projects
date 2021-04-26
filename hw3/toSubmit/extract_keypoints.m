
function [x, y, scores, Ih, Iv] = extract_keypoints(image)
    k = 0.05;
    window = 5;
    gray = rgb2gray(image);
    
    filterx = [-1,1];
    filtery = [-1;1];
    Ih = double(imfilter(gray, filterx, 'conv', 'replicate'));
    Iv = double(imfilter(gray, filtery, 'conv', 'replicate'));
    
    x = [];
    y = [];
    scores = [];
    R = zeros(size(gray));
    
    for i = 1:size(gray,1)
       for j = 1:size(gray,2)
           M = zeros(2,2);
           for r = i-floor(window/2):i+floor(window/2)
               if r < 1 || r >size(gray,1)
                    continue
               end
               for c = j-floor(window/2):j+floor(window/2)
                   if c < 1 || c >size(gray,2)
                        continue
                   end
                   M(1,1) = M(1,1)+Ih(r,c).^2;
                   M(1,2) = M(1,2)+Ih(r,c)*Iv(r,c);
                   M(2,1) = M(2,1)+Ih(r,c)*Iv(r,c);
                   M(2,2) = M(2,2)+Iv(r,c).^2;
               end
           end
           det = M(1,1)*M(2,2);
           trace = M(1,1)+M(2,2);
           ked = k*trace;
           R(i,j) = det-ked;
       end
    end
    threshold = R > mean(R)*5;
    R(threshold~=1) = 0;
    
    for i = 1:size(gray,1)
       for j = 1:size(gray,2)
           for r = i-1:i+1
               if r < 1 || r >size(gray,1)
                    R(i,j) = 0;
                    continue
               end
               for c = j-1:j+1
                   if c < 1 || c >size(gray,2)
                        R(i,j) = 0;
                        continue
                   end
                   if r == i && c == j
                       continue
                   end
                   if R(i,j) < R(r,c)
                       R(i,j) = 0;
                   end
               end
           end
       end
    end
    
    for i = 1:size(gray,1)
       for j = 1:size(gray,2)
           if R(i,j) ~= 0
                x(end+1) = i;
                y(end+1) = j;
                scores(end+1) = R(i,j);
           end
       end
    end
    
    x = x(:);
    y = y(:);
    scores = scores(:);
    
%     figure;
%     imshow(image);
%     hold on
%     for i = 1:size(x)
%         for cardinal1.jpg  
%         plot(x(i), y(i), 'bo', 'MarkerSize', scores(i) / 1000000000 * 2);
%         for panda1.jpg 
%         plot(x(i), y(i), 'bo', 'MarkerSize', scores(i) / 100000000); 
%         for leopartd1.jpg
%         plot(x(i), y(i), 'bo', 'MarkerSize', scores(i) / 1000000000);
%     end
%     saveas(gcf, 'vis1.png');
    
end