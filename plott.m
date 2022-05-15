%%Compare the predicted labels with actual labels of the test data

figure
for i = 1:numel(YPred)
    subplot(2,2,i)
    plot(YPred{i},'.-')
    hold on
    plot(YTest{i})
    hold off
    num = num2str(i);
    title_name = ['fault of type ',num];
    xlabel("Time Step")
    ylabel("Labels")
    title(title_name)
    legend(["Predict" "Test"])
end