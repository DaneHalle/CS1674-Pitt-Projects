function [Output] = my_conv(Image, Filter, Padding, Stride)
    padded_image = padarray(Image, [Padding Padding], 0, 'both');
    pos = [1; 1];
    opos = [1;1];
    while pos(1)+size(Filter,1)-1 <= size(padded_image,1)
        while pos(2)+size(Filter,1)-1 <= size(padded_image,2)
%             Not elegent. I know
            filter_sub = [padded_image(pos(1), pos(2)) padded_image(pos(1), pos(2)+1) padded_image(pos(1), pos(2)+2); padded_image(pos(1)+1, pos(2)) padded_image(pos(1)+1, pos(2)+1) padded_image(pos(1)+1, pos(2)+2); padded_image(pos(1)+2, pos(2)) padded_image(pos(1)+2, pos(2)+1) padded_image(pos(1)+2, pos(2)+2)];
            for i = 1:3
                for j = 1:3
                    filter_sub(i, j) = filter_sub(i, j)* Filter(i,j);
                end
            end
            Output(opos(1), opos(2)) = sum(sum(filter_sub));
            
            pos(2) = pos(2)+Stride;
            opos(2) = opos(2) + 1;
        end
        pos(1) = pos(1)+Stride;
        pos(2) = 1;
        opos(1) = opos(1) + 1;
        opos(2) = 1;
    end
end