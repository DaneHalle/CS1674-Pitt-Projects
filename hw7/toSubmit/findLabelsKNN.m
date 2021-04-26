function [predicted_labels_test] = findLabelsKNN(pyramids_train, labels_train, pyramids_test, k)
    size_train_image_set = size(pyramids_train,1);
    size_test_image_set = size(pyramids_test,1);
    
    for i = 1:size_test_image_set
        for j = 1:size_train_image_set
            dist(i,j) = pdist2(pyramids_test(i,:), pyramids_train(j,:));
        end
        [D, I] = sort(dist(i,:), 'ascend');
        for z = 1:k
            found(z) = labels_train(I(z));
        end
        predicted_labels_test(i) = mode(found);
    end    
    predicted_labels_test = predicted_labels_test.';
end