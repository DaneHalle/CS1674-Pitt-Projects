image1 = imread("keble1.png");
image2 = imread("keble2.png");
% PA
% 267, 104
% 313, 20
% 266, 223
% 332, 169
% 161, 145
% 163, 78
% 360, 196
% 218, 181

% PB
% 171, 119
% 218, 37
% 166, 236
% 232, 183
% 63, 158
% 67, 89
% 258, 212
% 120, 193

PA = [267 104; 313 20; 266 223; 332 169; 161 145; 163 78; 360 196; 218 181];
PB = [171 119; 218 37; 166 236; 232 183; 63 158; 67 89; 258 212; 120 193];

p1 = [280; 123];
% p1 = [PA(:,1).' ; PA(:,2).'];

H = estimate_homography(PA, PB);
[p2] = apply_homography(p1, H);

figure;
subplot(1,2,1);
imshow(image1);
axis on
hold on;
for i=1:size(p1,2)
    plot(p1(1,i), p1(2,i), 'g+', 'MarkerSize', 10, 'LineWidth', 2);
end
subplot(1,2,2);
imshow(image2);
axis on
hold on;
for i=1:size(p1,2)
    plot(p2(1,i), p2(2,i), 'y+', 'MarkerSize', 10, 'LineWidth', 2);
end
saveas(gcf, 'keble_onept.png')

mos = zeros(3*size(image2,1),3*size(image2,2), 3);
for i=1:size(image2,1)
    for j=1:size(image2,2)
        mos(size(image2,1)+i,size(image2,2)+j, 1) = image2(i,j,1);
        mos(size(image2,1)+i,size(image2,2)+j, 2) = image2(i,j,2);
        mos(size(image2,1)+i,size(image2,2)+j, 3) = image2(i,j,3);
    end
end

for i=1:size(image1,1)
    for j=1:size(image1,2)
        m1 = [j;i];
        [m2] = apply_homography(m1, H);
        m1=[];
        m2(1) = m2(1)+size(image2,2);
        m2(2) = m2(2)+size(image2,1);
        if m2(1)<1
            m2(1)=1;
        end
        if m2(2)<1
            m2(2)=1;
        end      

        xH = ceil(m2(2));
        xL = floor(m2(2));
        yH = ceil(m2(1));
        yL = floor(m2(1));
        
        mos(xH,yH, 1) = image1(i,j,1);
        mos(xH,yH, 2) = image1(i,j,2);
        mos(xH,yH, 3) = image1(i,j,3);
        
        mos(xH,yL, 1) = image1(i,j,1);
        mos(xH,yL, 2) = image1(i,j,2);
        mos(xH,yL, 3) = image1(i,j,3);
        
        mos(xL,yH, 1) = image1(i,j,1);
        mos(xL,yH, 2) = image1(i,j,2);
        mos(xL,yH, 3) = image1(i,j,3);
        
        mos(xL,yL, 1) = image1(i,j,1);
        mos(xL,yL, 2) = image1(i,j,2);
        mos(xL,yL, 3) = image1(i,j,3);
    end
end

mos=uint8(mos);
figure
imshow(mos);
saveas(gcf, 'keble_mosaic.png')


image1 = imread("uttower1.jpeg");
image2 = imread("uttower2.jpeg");
% PA
% 440, 303
% 442, 558
% 309, 608
% 372, 292
% 110, 592
% 97, 503
% 179, 524
% 345, 530
% 305, 496
% 472, 468
% 283, 641
% 288, 228

% PB
% 889, 327
% 907, 592
% 774, 644
% 808, 316
% 564, 615
% 566, 541
% 638, 560
% 816, 564
% 757, 529
% 933, 497
% 747, 675
% 724, 261

PA = [440 303; 442 558; 309 608; 372 292; 110 592; 97 503; 179 524; 345 530; 305 496; 472 468; 283 641; 288 228];
PB = [889 327; 907 592; 774 644; 808 316; 564 615; 566 541; 638 560; 816 564; 757 529; 933 497; 747 675; 724 261];

p1 = [141; 523];
% p1 = [PA(:,1).' ; PA(:,2).'];

H = estimate_homography(PA, PB);
[p2] = apply_homography(p1, H);

figure;
subplot(1,2,1);
imshow(image1);
axis on
hold on;
for i=1:size(p1,2)
    plot(p1(1,i), p1(2,i), 'g+', 'MarkerSize', 10, 'LineWidth', 2);
end
subplot(1,2,2);
imshow(image2);
axis on
hold on;
for i=1:size(p1,2)
    plot(p2(1,i), p2(2,i), 'y+', 'MarkerSize', 10, 'LineWidth', 2);
end
saveas(gcf, 'uttower_onept.png')

mos = zeros(3*size(image2,1),3*size(image2,2), 3);
for i=1:size(image2,1)
    for j=1:size(image2,2)
        mos(size(image2,1)+i,size(image2,2)+j, 1) = image2(i,j,1);
        mos(size(image2,1)+i,size(image2,2)+j, 2) = image2(i,j,2);
        mos(size(image2,1)+i,size(image2,2)+j, 3) = image2(i,j,3);
    end
end

for i=1:size(image1,1)
    for j=1:size(image1,2)
        m1 = [j;i];
        [m2] = apply_homography(m1, H);
        m1=[];
        m2(1) = m2(1)+size(image2,2);
        m2(2) = m2(2)+size(image2,1);
        if m2(1)<1
            m2(1)=1;
        end
        if m2(2)<1
            m2(2)=1;
        end      

        xH = ceil(m2(2));
        xL = floor(m2(2));
        yH = ceil(m2(1));
        yL = floor(m2(1));
        
        mos(xH,yH, 1) = image1(i,j,1);
        mos(xH,yH, 2) = image1(i,j,2);
        mos(xH,yH, 3) = image1(i,j,3);
        
        mos(xH,yL, 1) = image1(i,j,1);
        mos(xH,yL, 2) = image1(i,j,2);
        mos(xH,yL, 3) = image1(i,j,3);
        
        mos(xL,yH, 1) = image1(i,j,1);
        mos(xL,yH, 2) = image1(i,j,2);
        mos(xL,yH, 3) = image1(i,j,3);
        
        mos(xL,yL, 1) = image1(i,j,1);
        mos(xL,yL, 2) = image1(i,j,2);
        mos(xL,yL, 3) = image1(i,j,3);
    end
end

mos=uint8(mos);
figure
imshow(mos);
saveas(gcf, 'uttower_mosaic.png')

impixelinfo;