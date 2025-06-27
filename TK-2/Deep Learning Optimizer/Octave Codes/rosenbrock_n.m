function [f, grad] = rosenbrock_n(x)
    % Fungsi Rosenbrock multivariat dan gradien untuk dimensi N
    n = length(x);
    f = 0;
    grad = zeros(n,1);

    for i = 1:n-1
        f = f + 100*(x(i+1) - x(i)^2)^2 + (1 - x(i))^2;
        grad(i)   = grad(i)   - 400*(x(i+1) - x(i)^2)*x(i) - 2*(1 - x(i));
        grad(i+1) = grad(i+1) + 200*(x(i+1) - x(i)^2);
    end
end
