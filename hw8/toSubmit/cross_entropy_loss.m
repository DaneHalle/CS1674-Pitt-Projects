function [loss] = cross_entropy_loss(scores, correct_class)
    div = 0;
    for i = 1:length(scores)
        div = div + exp(scores(i));
    end
    [loss] = -log((exp(scores(correct_class)))/div);
end