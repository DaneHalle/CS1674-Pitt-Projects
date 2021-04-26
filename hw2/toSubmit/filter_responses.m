filename = ["cardinal1.jpg", "cardinal2.jpg", "leopard1.jpg", "leopard2.jpg", "panda1.jpg", "panda2.jpg"];

cc_out = [];

idx = 3;

for f = 1:length(F)-1
    figure
    subplot(2,4,1);
    plot(F(:,:, f))
    for i = 1:length(filename)
        im = imread(filename{i});
        im = rgb2gray(im);
        im = imresize(im, [100, 100]);

        cc = imfilter(im, F(:, :, f));


        subplot(2,4,idx);
        plot(cc);
        title(filename{i});
        idx = idx+1;

        
    end
%     saveas(gcf, strcat('subplots/responses_to_filter_', num2str(f), '.png'))
    idx = 3;
end

