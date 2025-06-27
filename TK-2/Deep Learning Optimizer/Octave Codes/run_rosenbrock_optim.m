% Daftar ukuran dimensi N
Ns = [3, 7, 100, 500, 1000];

for i = 1:length(Ns)
    N = Ns(i);
    fprintf('==============================\n');
    fprintf('Optimisasi fungsi Rosenbrock dengan Quasi Newton BFGS untuk N = %d\n', N);

    % Tebakan awal umum x0 = [-1, -1,..., -1]
    x0 = -ones(N,1);

    tic;
    [x_opt, f_val, grad, iter, back_errs] = quasi_newton_bfgs(N, x0);
    elapsed_time = toc;
    converge_rate = log(back_errs(iter)/back_errs(iter-1))...
                    /log(back_errs(iter-1)/back_errs(iter-2));

    fprintf('Iterasi: %d\n', iter);
    fprintf('Nilai x:\n');
    disp(x_opt(1:min(size(x_opt,1),10)));
    fprintf('Nilai grad f(x):\n');
    disp(grad(1:min(size(grad,1),10)));
    fprintf('Waktu komputasi: %.2f detik\n\n', elapsed_time);
    fprintf('Estimasi laju konvergensi: %.2f \n\n', converge_rate);
end

