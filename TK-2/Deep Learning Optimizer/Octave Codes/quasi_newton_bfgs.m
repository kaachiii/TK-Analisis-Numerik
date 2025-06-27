function [x, f_val, grad, k, back_errs] = quasi_newton_bfgs(n, x0)
    % Optimisasi fungsi Rosenbrock dengan dimensi N
    x = x0;
    max_iter = 2000;
    tol = 1e-6;
    H = eye(n);
    back_errs = zeros(max_iter,1);  % Array penyimpan backward error

    for k = 1:max_iter
        [f_val, grad] = rosenbrock_n(x);
        back_errs(k) = norm(grad);
        if back_errs(k) < tol
            fprintf('Konvergen pada N=%d dalam %d iterasi\n', n, k);
            % Truncate array penyimpan backward error sampai ujung iterasi terakhir saja
            back_errs = back_errs(1:k);
            return;
        end

        % Tentukan arah pencarian
        p = -H * grad;

        % === Backtracking line search (Armijo rule) ===
        alpha = 1;
        rho_ls = 0.5;
        c = 1e-4;
        while true
            x_new = x + alpha * p;
            f_new = rosenbrock_n(x_new);
            if f_new <= f_val + c * alpha * grad' * p
                break;
            end
            alpha = alpha * rho_ls;
            if alpha < 1e-8
                warning('Step size terlalu kecil, keluar dari line search');
                break;
            end
        end

        [~, grad_new] = rosenbrock_n(x_new);
        s = x_new - x;
        y = grad_new - grad;
        ys = y' * s;

        if abs(ys) < 1e-10
            x = x_new;
            continue;
        end

        rho = 1 / ys;

        I = eye(n);
        H = (I - rho * (s * y')) * H * (I - rho * (y * s')) + rho * (s * s');

        x = x_new;
    end

    fprintf('Maksimum iterasi tercapai untuk N=%d\n', n);
end

