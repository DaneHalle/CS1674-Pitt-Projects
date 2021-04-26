% 8
function [B] = normalize_rows(A)
    B = repmat(sum(A, 2),size(A, 2))
end