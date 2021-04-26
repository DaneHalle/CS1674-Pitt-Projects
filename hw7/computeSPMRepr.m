function [pyramid, level_0, level_1] = computeSPMRepr(im_size, sift, means)
    height = im_size(1);
    width = im_size(2);
    f = sift.f;
    d = sift.d;
    
    [level_0] = computeBOWRepr(d.', means);
    
    splitH = height/2;
    splitW = width/2;
    
    q1 = [];
    q2 = [];
    q3 = [];
    q4 = [];
    
    for i = 1:size(f,2)
        if f(1,i) < splitH && f(2,i) < splitW
            q1(:,end+1) = d(:,i);
        elseif f(1,i) >= splitH && f(2,i) < splitW
            q2(:,end+1) = d(:,i);
        elseif f(1,i) < splitH && f(2,i) >= splitW
            q3(:,end+1) = d(:,i);
        else
            q4(:,end+1) = d(:,i);
        end
    end
    [bow1q1] = computeBOWRepr(q1.', means);
    [bow1q2] = computeBOWRepr(q2.', means);
    [bow1q3] = computeBOWRepr(q3.', means);
    [bow1q4] = computeBOWRepr(q4.', means);
    
    q1q2 = cat(2, bow1q1, bow1q2);
    q3q4 = cat(2, bow1q3, bow1q4);
    level_1 = cat(2, q1q2, q3q4);
    
    pyramid = cat(2, level_0, level_1);
end