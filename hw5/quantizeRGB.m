function [outputImg, meanColors, clusterIds] = quantizeRGB(origImg, k)
    outputImg = origImg;
    meanColors = zeros(k,3);
    numpixels = size(origImg,1)*size(origImg,2);
    clusterIds = zeros(numpixels,1);
    
    X = reshape(origImg, [numpixels, 3]);
    [clusterIds,meanColors] = kmeans(double(X), k, 'MaxIter',1000);
    
%     imshow(clusterIDs);
    z=1;
    for i = 1:size(origImg,2)
        for j = 1:size(origImg,1)
            outputImg(j,i,1) = meanColors(clusterIds(z),1);
            outputImg(j,i,2) = meanColors(clusterIds(z),2);
            outputImg(j,i,3) = meanColors(clusterIds(z),3);
            z = z+1;
        end
    end
    
    figure;
    imshow(outputImg);
    title(strcat('Quantized image (RGB) for k=', num2str(k), ''));
    saveas(gcf, strcat('k', num2str(k), '.png'));
end