function [Output] = my_pool(Input, Pool_Size)
    pos = [1;1];
    for i = 1:Pool_Size:size(Input,1)
        if (i+Pool_Size > size(Input,1)+1)
            break;
        end
        for j = 1:Pool_Size:size(Input,2)
            if (j+Pool_Size > size(Input,2)+1)
                continue;
            end
            for pi = 1:Pool_Size
                for pj = 1:Pool_Size
                    focused(pi, pj) = Input(i+pi-1,j+pj-1);
                end
            end
            Output(pos(1),pos(2)) = max(max(focused));
            pos(2) = pos(2)+1;
        end
        pos(1) = pos(1)+1;
        pos(2) = 1;
    end
end