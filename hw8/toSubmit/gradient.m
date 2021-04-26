h=0.0001;
l = 0.001;

W1_unaltered_store = W1;
old_scores_x1 = W1*x1;
old_scores_x2 = W1*x2;
old_scores_x3 = W1*x3;
old_scores_x4 = W1*x4;
old_loss = mean([hinge_loss(old_scores_x1, 1) hinge_loss(old_scores_x2, 2) hinge_loss(old_scores_x3, 3) hinge_loss(old_scores_x4, 4)]);

w1_vector = W1(:);

for i = 1:size(w1_vector)
    w1_vector_temp = w1_vector;
    w1_vector_temp(i) = w1_vector(i)+h;
    
    
    w1_plus_h = reshape(w1_vector_temp, [4,25]);

    new_scores_x1 = w1_plus_h*x1;
    new_scores_x2 = w1_plus_h*x2;
    new_scores_x3 = w1_plus_h*x3;
    new_scores_x4 = w1_plus_h*x4;

    new_loss = mean([hinge_loss(new_scores_x1, 1) hinge_loss(new_scores_x2, 2) hinge_loss(new_scores_x3, 3) hinge_loss(new_scores_x4, 4)]);

    E = (new_loss-old_loss)/h;
    
    grad(i) = E;
    
end

grad = reshape(grad, [4,25]);


updated_W = W1 - l * grad;


updated_scores_x1 = updated_W*x1;
updated_scores_x2 = updated_W*x2;
updated_scores_x3 = updated_W*x3;
updated_scores_x4 = updated_W*x4;

updated_loss = mean([hinge_loss(updated_scores_x1, 1) hinge_loss(updated_scores_x2, 2) hinge_loss(updated_scores_x3, 3) hinge_loss(updated_scores_x4, 4)]);

if updated_loss < old_loss
    fprintf("Gradient decent step is likely working with an updated_loss of %f compared to an old loss of %f\n", updated_loss, old_loss);
else
    fprintf("Gradient decent step is likely not working with an updated_loss of %f compared to an old loss of %f\n", updated_loss, old_loss);
end

