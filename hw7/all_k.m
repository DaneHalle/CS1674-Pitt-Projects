testDat = [];
trainDat = [];

for i = 1:2:21
    [long_test] = findLabelsKNN(pyramids_train, train_labels, pyramids_test, i);
    [long_train] = findLabelsKNN(pyramids_train, train_labels, pyramids_train, i);
    testDat(i) = sum(long_test==test_labels)/size(test_labels,1);
    trainDat(i) = sum(long_train==train_labels)/size(train_labels,1);
end

figure;
plot((1:100), testDat, 'r');
hold on;
plot((1:100), trainDat, 'r--');
hold on;

xlabel("k Nearest Neighbors");
ylabel("Classifier accuracy");
legend("KNN Test Accuracy","KNN Train Accuracy");