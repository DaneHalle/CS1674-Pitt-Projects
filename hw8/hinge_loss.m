function [loss] = hinge_loss(scores, correct_class)
    adding = 0;
    for i = 1:length(scores)
        if i ~= correct_class
            adding = adding + max(0, scores(i) - scores(correct_class) + 1);
        end
    end
    [loss] = adding;
end