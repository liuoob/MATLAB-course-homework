function L2norm = L2normPlot(func, originalFunc, point_num)
    iter_index = 0;
    iter_end = 7;
    L2norm = zeros(8, 1);
    h_e = zeros(8, 1);
    
    for i = iter_index:iter_end
        n = 2 ^ i;
        d = solve(n, func);
        [base, ~] = baseConstruct(n, point_num);
        u = d' * base(1:n, :);    
        % solve L2 norm
        L2norm(i + 1) = norm(originalFunc - u, 2);
        h_e(i + 1) = 1 / n;
    end
end