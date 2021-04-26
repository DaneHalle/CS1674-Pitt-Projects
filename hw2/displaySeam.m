
function displaySeam(im, seam, seamDirection)
    rows = size(im, 1);
    columns = size(im, 2);
    
    imshow(im);
    if strcmp(seamDirection, 'VERTICAL')
      for i = 1:rows
          hold on;
          plot(seam(i), i, 'r.');
      end
    else
      assert(strcmp(seamDirection, 'HORIZONTAL'));
      for i = 1:columns
          hold on;
          plot(i, seam(i), 'r.');
      end
    end
end