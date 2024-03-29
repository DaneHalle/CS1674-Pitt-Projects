digitDatasetPath = fullfile('scenes_lazebnik');
imds = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

numTrainingFiles = 75;
[imdsTrain, imdsTest] = splitEachLabel(imds, numTrainingFiles, 'randomize');

options = trainingOptions('sgdm', ...
    'MaxEpochs', 20, ...
    'InitialLearnRate', 1e-3, ...
    'Verbose', false, ...
    'MiniBatchSize',100, ...
    'Plots', 'training-progress');

net = alexnet;

layers = [ ...
    net.Layers(1:16)
    fullyConnectedLayer(8)
    softmaxLayer('Name', "SoftMax")
    classificationLayer
    ];

net = trainNetwork(imdsTrain, layers, options);

classified = classify(net, imdsTest);
labels = imdsTest.Labels;

accuracy = sum(classified == labels)/numel(labels);
