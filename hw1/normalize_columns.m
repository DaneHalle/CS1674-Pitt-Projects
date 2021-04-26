% 9
function [B] = normalize_columns(A)
    B = repmat(sum(A),size(A));
end