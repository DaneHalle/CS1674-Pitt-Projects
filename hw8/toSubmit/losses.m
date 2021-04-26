s11 = W1*x1;
s12 = W1*x2;
s13 = W1*x3;
s14 = W1*x4;
s21 = W2*x1;
s22 = W2*x2;
s23 = W2*x3;
s24 = W2*x4;
s31 = W3*x1;
s32 = W3*x2;
s33 = W3*x3;
s34 = W3*x4;

w1LossHinge = mean([hinge_loss(s11, 1), hinge_loss(s12, 2), hinge_loss(s13, 3), hinge_loss(s14, 4)])
w1LossCross = mean([cross_entropy_loss(s11, 1), cross_entropy_loss(s12, 2), cross_entropy_loss(s13, 3), cross_entropy_loss(s14, 4)])

w2LossHinge = mean([hinge_loss(s21, 1), hinge_loss(s22, 2), hinge_loss(s23, 3), hinge_loss(s24, 4)])
w2LossCross = mean([cross_entropy_loss(s21, 1), cross_entropy_loss(s22, 2), cross_entropy_loss(s23, 3), cross_entropy_loss(s24, 4)])

w3LossHinge = mean([hinge_loss(s31, 1), hinge_loss(s32, 2), hinge_loss(s33, 3), hinge_loss(s34, 4)])
w3LossCross = mean([cross_entropy_loss(s31, 1), cross_entropy_loss(s32, 2), cross_entropy_loss(s33, 3), cross_entropy_loss(s34, 4)])
