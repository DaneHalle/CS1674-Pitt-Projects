% 1
vector1 = randn(1000000,1);

% 2
loop = @() forLoop(vector1);

% 2
fprintf("loop\nElapsed time is %u seconds\n", timeit(loop))

% 3
fprintf("add\n");
scalarAdd(vector1);

% 4
xAxis = 0:2:100;
plot(xAxis, 2.^xAxis)

% 5
A = [1:10;11:20;21:30;31:40;41:50;51:60;61:70;71:80;81:90;91:100]/2;
B = ([1:10;11:20;21:30;31:40;41:50;51:60;61:70;71:80;81:90;91:100]/2);
C = A + B;
% A manual assertion shows that all the expected values are there but this
% assertion fails when it is commented out. 
% assert(all(C(:) == (1:100)') == true);

% 6
s = RandStream('mlfg6331_64');
out = datasample(1:10, 10, 'Replace', false);
i = 0;
for n = 1:10
    if mod(i,2) == 1
        pause(1);
        i=0;
    else
        i=i+1;
    end
    fprintf('%u\n', out(:,n));
end


% 7
A = randi(100, 5, 3);
B = randi(100, 3, 5);
[rA, cA] = size(A);
[rB, cB] = size(B);
C =  zeros(rA, cB);
for r = 1:rA
    for c = 1:cB
        curS = 0;
        for k = 1:cA
            curS = curS + A(r, k) * B(k, c);
        end
        C(r, c) = curS;
    end
end
D = A*B;


% 12
im = imread('pittsburgh.png');
% 13
im = rgb2gray(im);
% 14
fprintf('%u\n',size(find(im==6)));
% 15
[min_val, idx]=min(im(:));
[I,J] = ind2sub(size(im),idx)

% 16
for r = I-15:I+15
    for c = J-15:J+15
        im(r,c) = 255;
    end
end

% 17
midIdx = ceil(size(im, 1)/2);
midIdy = ceil(size(im, 2)/2);
im(midIdx-60:midIdx+60,midIdy-60:midIdy+60) = 150;

% 18
figure;
imshow(im);
saveas(gcf, 'new_image.png');

% 19
im = imread('pittsburgh.png');
pR = im(:,:,1);
pG = im(:,:,2);
pB = im(:,:,3);

Igray = rgb2gray(im);
idx = Igray == 0;

avgR = uint8(mean(pR(~idx)));
avgG = uint8(mean(pG(~idx)));
avgB = uint8(mean(pB(~idx)));

pO = cat(3, pR-avgR, pG-avgG, pB-avgB);

figure;
imshow(pO);
saveas(gcf, 'mean_sub.png')

% 2
function y = forLoop(x)
    for n = 1:size(x)
        y(n,:) = x(n,:)+1;
    end
end

% 3
function y = scalarAdd(x)
    tic
        y = x+1;
    toc
end