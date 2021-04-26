digitDatasetPath = fullfile('scenes_lazebnik');
imds = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

numTrainingFiles = 75;
[imdsTrain, imdsTest] = splitEachLabel(imds, numTrainingFiles, 'randomize');

layers = [ ...
    imageInputLayer([227 227 3])
%     A
    convolution2dLayer(11,50,'Stride', 4)
    reluLayer('Name', "A_RELU")
	maxPooling2dLayer(3, 'Stride', 1)
%     B
    convolution2dLayer(5, 60)
    reluLayer('Name', "B_RELU")
    maxPooling2dLayer(3, 'Stride', 2)
%     C
    fullyConnectedLayer(8)
    softmaxLayer('Name', "C_SoftMax")
    classificationLayer];

options = trainingOptions('sgdm', ...
    'MaxEpochs', 20, ...
    'InitialLearnRate', 1e-3, ...
    'Verbose', false, ...
    'MiniBatchSize',100, ...
    'Plots', 'training-progress');

net = trainNetwork(imdsTrain, layers, options);

classified = classify(net, imdsTest);
labels = imdsTest.Labels;

accuracy = sum(classified == labels)/numel(labels);
