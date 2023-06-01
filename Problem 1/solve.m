% This MATLAB script is the extraction of the general solution.
% Args:
%   n -> int: The number of elements
%   f -> anomyous function: the one in u_,xx + f(x) = 0, explicitly defined
function d = solve(n, f)
    K = zeros(n);
    F = zeros(n, 1);
    h = 1 / n;

    k_local = n * [1, -1; -1, 1];
    x_A = 0;
    boundary_term = 0;
    
    for e = 1: n - 1    
        f_local = h / 6 * [2, 1;1, 2] * [f(x_A); f(x_A + h)];
        x_A = x_A + h;
        for a = 1:2
            for b = 1:2
                K(LM(a, e), LM(b, e)) = K(LM(a, e), LM(b, e)) + k_local(a, b);
            end
        boundary_term = 0;
        if e == 1
            boundary_term = KroneckerDelta(a, 1);
        end
        F(LM(a, e)) = F(LM(a, e)) + f_local(a) + boundary_term;
        end
    end

    if n == 1
        boundary_term = [KroneckerDelta(1, 1); KroneckerDelta(2, 1)];
    end
    f_local = h / 6 * [2, 1;1, 2] * [f(x_A); f(x_A + h)] + boundary_term;
    K(n, n) = K(n, n) + k_local(1, 1);
    F(n) = F(n) + f_local(1);

    d = K \ F;    
end
function val = KroneckerDelta(i, j)
    if i == j
        val = 1;
    else
        val = 0;
    end
end