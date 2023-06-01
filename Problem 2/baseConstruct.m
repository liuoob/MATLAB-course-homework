function base = baseConstruct(n, x)
    h = 1 / n;
    base = zeros(n + 1, length(x));
    base(1, 0 <= x & x <= h) = (h - x(0 <= x & x <= h)) / h;
    for e = 2:n
        xl = h * (e - 2);
        xr = h * e;
        xcur = h * (e - 1);
        base(e, xl <= x & x <= xcur) = ...
            (x(xl <= x & x <= xcur) - xl) / h;
        base(e, xcur <= x & x <= xr) = ...
            (xr - x(xcur <= x & x <= xr)) / h;
    end
    base(n + 1, h * (n - 1) <= x & x <= 1) = ...
        (x(h * (n - 1) <= x & x <= 1) - h * (n - 1)) / h;
end