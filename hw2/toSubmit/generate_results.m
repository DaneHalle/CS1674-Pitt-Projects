
function [] = generate_results(filename, reduceAmt, reduceWhat)

    im = imread(filename);
    
    num_rows = size(im, 1);
    num_cols = size(im, 2);
    
    og = im;
    
    if (strcmp(reduceWhat, 'WIDTH'))
        im = reduceWidth(im, true);
        for i = 1:reduceAmt-1
            im = reduceWidth(im, false);
        end
    
        figure;
        subplot(1,3,1);
        imshow(og);
        title("original");
        subplot(1,3,2);
        imshow(im);
        title("content-aware");
        subplot(1,3,3);
        imshow(imresize(og, [num_rows num_cols-reduceAmt]));
        title("standard");
        saveas(gcf, strtok(filename, '.')+'_width_reduced.png')
    else
        assert(strcmp(reduceWhat, 'HEIGHT'));
        im = reduceHeight(im, true);
        for i = 1:reduceAmt-1
            im = reduceHeight(im, false);
        end
    
        figure;
        subplot(1,3,1);
        imshow(og);
        title("original");
        subplot(1,3,2);
        imshow(im);
        title("content-aware");
        subplot(1,3,3);
        imshow(imresize(og, [num_rows-reduceAmt num_cols]));
        title("standard");
        saveas(gcf, strtok(filename, '.')+'_height_reduced.png')
    end
end