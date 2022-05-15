
%%Sequence-to-Sequence Classification Using LSTM
%%To find out when was the time that the fault occurs and make predictions
%%to find out early faults,you can use a LSTM network to classify each time
%%step of sequence data

%%Load train set
XTrain=Xtrain(1);
YTrain=Ytrain(1);

%%Clarify categories
X = XTrain{1}(1,:);
e=[1,2,3,4];
classes = categorical(e);

%%Define LSTM network
numFeatures = 2;
numHiddenUnits = 50;
numClasses = 4;

layers = [ ...
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits,'OutputMode','sequence')
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer];


%%Specify training options
options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.01,...
    'LearnRateSchedule','piecewise',...
    'LearnRateDropFactor',0.1,...
    'LearnRateDropPeriod',350,...
    'MaxEpochs',600, ...
    'GradientThreshold',2, ...
    'Verbose',0, ...
    'Plots','training-progress');

%%Train LSTM network
net = trainNetwork(XTrain,YTrain,layers,options);

%%Load test data
XTest=Xtest(1);
YTest=Ytest(1);

%%Classify test data using trained LSTM network
YPred = classify(net,XTest);

%%Calculate accuracy 
a=0;
for i=1:4
    YYPred=YPred{i};
    YYTest=YTest{i};
    anss=sum(YYPred==YYTest);
    a=a+anss;
end
p=numel(YTest);
m=0;
for i=1:p
    n=numel(YTest{p});
    m=m+n;
end
acc=a/m
