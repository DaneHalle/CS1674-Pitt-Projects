
pyramids_test = [];

for i = 1:test_id
    [pyramid, level_0, level_1] = computeSPMRepr(test_images(i,:), test_sift{i,1}, means);
    pyramids_test(i,:) = pyramid;
end

pyramids_train = [];

for i = 1:train_id
    [pyramid, level_0, level_1] = computeSPMRepr(train_images(i,:), train_sift{i,1}, means);
    pyramids_train(i,:) = pyramid;
end

testDat = [];
trainDat = [];

for i = 1:21
    [long_test] = findLabelsKNN(pyramids_train, train_labels, pyramids_test, i);
    [long_train] = findLabelsKNN(pyramids_train, train_labels, pyramids_train, i);
    testDat(i) = sum(long_test==test_labels)/size(test_labels,1);
    trainDat(i) = sum(long_train==train_labels)/size(train_labels,1);
end


[predicted_labels_test_SVM] = findLabelsSVM(pyramids_train, train_labels, pyramids_test);
accuracySVM = sum(predicted_labels_test_SVM==test_labels)/size(test_labels,1);

[predicted_labels_train_SVM] = findLabelsSVM(pyramids_train, train_labels, pyramids_train);
accuracySVM_train = sum(predicted_labels_train_SVM==train_labels)/size(train_labels,1);


figure;
plot((1:21), testDat, 'r');
hold on;
plot((1:21), trainDat, 'r--');
hold on;
plot((1:21), accuracySVM*ones(1,21), 'b');
hold on;
plot((1:21), accuracySVM_train*ones(1,21), 'b--');
hold on;

xlabel("k Nearest Neighbors");
ylabel("Classifier accuracy");
legend("KNN Test Accuracy","KNN Train Accuracy", "SVM Test Accuracy", "SVM Train Accuracy");