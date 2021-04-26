x = [10; 1; 2; 3];

weights1 = [];
weights1(1,1) = 0.5;
weights1(1,2) = 0.6;
weights1(1,3) = 0.4;
weights1(1,4) = 0.3;

weights1(2,1) = 0.02;
weights1(2,2) = 0.25;
weights1(2,3) = 0.4;
weights1(2,4) = 0.3;

weights1(3,1) = 0.82;
weights1(3,2) = 0.1;
weights1(3,3) = 0.35;
weights1(3,4) = 0.3;

weights2= [];
weights2(1,1) = 0.7;
weights2(1,2) = 0.45;
weights2(1,3) = 0.5;

weights2(2,1) = 0.17;
weights2(2,2) = 0.9;
weights2(2,3) = 0.8;

z = tanh(weights1*x);

z(2)

z_relu = max(0,weights1*x);

y_sig = 1./(1+exp(- (weights2*z_relu)));

y_sig(1)
