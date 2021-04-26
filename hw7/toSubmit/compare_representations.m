
pyramids_test = [];
test_l0 = [];
test_l1 = [];

for i = 1:test_id
    [pyramid, level_0, level_1] = computeSPMRepr(test_images(i,:), test_sift{i,1}, means);
    pyramids_test(i,:) = pyramid;
    test_l0(i,:) = level_0;
    test_l1(i,:) = level_1;
end

pyramids_train = [];
train_l0 = [];
train_l1 = [];

for i = 1:train_id
    [pyramid, level_0, level_1] = computeSPMRepr(train_images(i,:), train_sift{i,1}, means);
    pyramids_train(i,:) = pyramid;
    train_l0(i,:) = level_0;
    train_l1(i,:) = level_1;
end

[predicted_labels_test] = findLabelsSVM(pyramids_train, train_labels, pyramids_test);
[predicted_labels_level0] = findLabelsSVM(train_l0, train_labels, test_l0);
[predicted_labels_level1] = findLabelsSVM(train_l1, train_labels, test_l1);

accuracy_pyramid = sum(predicted_labels_test==test_labels)/size(test_labels,1);
accuracy_level0 = sum(predicted_labels_level0==test_labels)/size(test_labels,1);
accuracy_level1 = sum(predicted_labels_level1==test_labels)/size(test_labels,1);