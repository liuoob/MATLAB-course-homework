% The main function of the solving process

clear
clc

% Arguments
% -----------------------------------------------------------------
point_num = 1000;
x = linspace(0, 1, point_num);
% -----------------------------------------------------------------

% if we suppose f(x) = 0, then we can get u^h = u = g + h(1 - x)
% the difference between the ans of f(x) = 0 and the one of other f(x)
% is called u^h_part and u_part
% e.g. suppose f = c, where c is a constant, then 
% u = g + h(1 - x) + 1 / 2 * c (1-x^2)
% u^h = g + h (1 - x) + 1 / 2 * c(1 - x)
% the different part is 1/2 * c(1 - x^2), and written as u_part
% u^h_part = 1/2 * c(1 - x)

hold on
% suppose f(x) = 1
f = @(x) 1;
res1 = L2normPlot(f, 1 - x + (1 - x .^2) / 2, point_num);

% suppose f(x) = x
f = @(x) x;
res2 = L2normPlot(f, 1 - x + (1 - x .^ 3) / 6, point_num);

% suppose f(x) = x^2
f = @(x) x ^ 2;
res3 = L2normPlot(f, 1 - x + (1 - x .^ 4) / 12, point_num);

n_list = 1:8;

plot(log10(n_list), log10(res1), log10(n_list), log10(res2), log10(n_list), log10(res3))
%legend('f = 1', 'f = x', 'f = x^2')
