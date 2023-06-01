% This function is the location matrix, LM(a, e), where LM(a, e) returns e
% if a == 1, or e + 1 if a == 2
function A = LM(a, e)
    if a == 1
        A = e;
    elseif a == 2
        A = e + 1;
    end
end