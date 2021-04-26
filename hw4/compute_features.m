
function [features] = compute_features(x, y, scores, Ix, Iy)
    newx = [];
    newy = [];
    newscores = [];
    
    for i = 1:size(x,1)
        if ~(x(i)-5 < 1 || x(i)+5 > size(Ix,1)-1 || y(i)-5 < 1 || y(i)+5>size(Ix,2)-1)
            newx(end+1)=x(i);
            newy(end+1)=y(i);
            newscores(end+1)=scores(i);
        end
    end
    x=newx(:);
    y=newy(:);
    scores=newscores(:);
    
    features = zeros(size(x,1), 8);
    
    m = zeros(size(Ix));
    theta = zeros(size(Ix));
    for i = 1:size(Ix,1)
        for j = 1:size(Ix,2)
            compS = Ix(i,j)*Ix(i,j) + Iy(i,j)*Iy(i,j);
            m(i,j) = sqrt(compS);
            if ~(m(i,j) == 0)
                compT = Iy(i,j) / Ix(i,j);
                theta(i,j)=atand(compT);
            end
        end
    end

    bins = theta;
    bin0 = -90+(22.5*0);
    bin1 = bin0+(22.5*1);
    bin2 = bin0+(22.5*2);
    bin3 = bin0+(22.5*3);
    bin4 = bin0+(22.5*4);
    bin5 = bin0+(22.5*5);
    bin6 = bin0+(22.5*6);
    bin7 = bin0+(22.5*7);
    for i = 1:size(bins,1)
        for j = 1:size(bins,2)
            if bins(i,j) <= bin1
                bins(i,j)=1;
            elseif bins(i,j) <= bin2
                bins(i,j)=2;
            elseif bins(i,j) <= bin3
                bins(i,j)=3;
            elseif bins(i,j) <= bin4
                bins(i,j)=4;
            elseif bins(i,j) <= bin5
                bins(i,j)=5;
            elseif bins(i,j) <= bin6
                bins(i,j)=6;
            elseif bins(i,j) <= bin7
                bins(i,j)=7;
            else
                bins(i,j)=8;
            end
        end
    end
    
    hist_final = zeros(size(x,1), 8);
    for z = 1:size(x,1)
        for i = x(z)-5:x(z)+5
            for j = y(z)-5:y(z)+5
                hist_final(z,bins(i,j)) = hist_final(z,bins(i,j))+m(i,j);
            end
        end
    end
    
    for i = 1:size(hist_final,1)
        hist_final(i,:) = hist_final(i,:) / sum(hist_final(i,:));
    end
    hist_final(hist_final>0.2) = 0.2;
    for i = 1:size(hist_final,1)
        hist_final(i,:) = hist_final(i,:) / sum(hist_final(i,:));
    end
    
    features=hist_final;
end