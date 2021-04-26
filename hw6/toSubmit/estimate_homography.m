function H = estimate_homography(PA, PB)
    x = PB(:,1).';
    y = PB(:,2).';
    X = PA(:,1).';
    Y = PA(:,2).';
    
    rows0 = zeros(3,size(PA,1));
    rowsXY = -[PA(:,1).'; PA(:,2).'; ones(1,size(PA,1))];
    
    hx = [rowsXY; rows0; PB(:,1).'.*PA(:,1).'; PB(:,1).'.*PA(:,2).'; PB(:,1).'];
    hy = [rows0; rowsXY; PB(:,2).'.*PA(:,1).'; PB(:,2).'.*PA(:,2).'; PB(:,2).'];
    A = [hx hy];
    
    [U, ~, ~] = svd(A);
    H = (reshape(U(:,9),3,3)).';
end