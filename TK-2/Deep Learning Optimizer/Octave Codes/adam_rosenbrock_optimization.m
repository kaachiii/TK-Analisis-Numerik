% Inisialisasi hyperparameter
gamma = 0.001;  % Learning rate
beta1 = 0.9;    % Decay momen pertama
beta2 = 0.999;  % Decay momen kedua
lambda = 0;     % Tidak ada decay
amsgrad = false;
maximize = false;
T = 10000;      % Jumlah iterasi
epsilon = 1e-8; % Pengstabil

% Inisialisasi vektor N
N_values = [3, 7, 100, 500, 1000];

% Definisikan fungsi gradien dari fungsi Rosenbrock
function gradient = rosenbrock_grad(x)
  N = length(x);
  gradient = zeros(N, 1);

  % Hitung gradien dari x_1
  gradient(1) = -400 * x(1) * (x(2) - x(1)^2) - 2 * (1 - x(1));

  % Hitung gradien dari x_2 hingga x_(N-1)
  for i = 2:(N-1)
    gradient(i) = -400 * x(i) * (x(i+1) - x(i)^2) - 2 * (1 - x(i)) + 200 * (x(i) - x(i-1)^2);
  endfor

  % Hitung gradien dari x_N
  gradient(N) = 200 * (x(N) - x(N-1)^2);
endfunction

% Definisikan fungsi Rosenbrock
function value = rosenbrock_func(x)
  N = length(x);
  value = 0;
  for i = 1:(N-1)
    value = value + 100 * (x(i+1) - x(i)^2)^2 + (1 - x(i))^2;
  endfor
endfunction

% Definisikan Adam Optimizer
function theta = adam_optimizer(theta0, grad_func, gamma, beta1, beta2, lambda, amsgrad, maximize, T, epsilon)
  theta = theta0;
  m = zeros(size(theta0)); % Momen pertama
  v = zeros(size(theta0)); % Momen kedua

  if amsgrad
    vmax = zeros(size(theta0)); % Momen kedua maksimum untuk AMSGrad
  endif

  for t = 1:T
    theta_grad = grad_func(theta);

    if maximize
      theta_grad = -theta_grad; % Negasi gradien untuk maximize
    endif

    if lambda ~= 0
      theta_grad = theta_grad + lambda * theta; % Weight decay
    endif

    m = beta1 * m + (1 - beta1) * theta_grad;
    v = beta2 * v + (1 - beta2) * (theta_grad .^ 2);

    m_hat = m / (1 - beta1^t);
    v_hat = v / (1 - beta2^t);

    if amsgrad
      v_max = max(v_max, v_hat);
      theta = theta - gamma * m_hat ./ (sqrt(v_max) + epsilon);
    else
      theta = theta - gamma * m_hat ./ (sqrt(v_hat) + epsilon);
    endif
  endfor
endfunction

% Tampilkan hiperparameter awal
printf("Hyperparameter initial:\n")
printf("theta0 = zeros(N, 1)\n")  % Diperbarui sesuai kode
printf("gamma = 0.001\n")        % Diperbarui sesuai kode
printf("beta1 = 0.9\n")
printf("beta2 = 0.999\n")        % Ditambahkan
printf("lambda = 0\n")
printf("amsgrad = false\n")
printf("maximize = false\n")
printf("T = 10000\n")
printf("epsilon = 1e-8\n")
printf("\n")

% Jalankan Adam Rosenbrock Optimization untuk seluruh elemen dari vektor N
for N = N_values
  % Tebakan awal: all zeros
  x0 = zeros(N, 1);

  % Mulai pengukuran waktu
  tic;

  % Jalankan Adam Optimizer
  x_opt = adam_optimizer(x0, @rosenbrock_grad, gamma, beta1, beta2, lambda, amsgrad, maximize, T, epsilon);

  % Hitung waktu yang telah berlalu
  elapsed_time = toc;

  % Hitung nilai akhir fungsi
  final_value = rosenbrock_func(x_opt);

  % Hitung jarak ke true minimum (all ones)
  true_min = ones(N, 1);
  distance_to_min = norm(x_opt - true_min);

  % Tampilkan hasil
  printf("N = %d\n", N);
  printf("Nilai akhir fungsi: %.6f\n", final_value);
  printf("Jarak ke true minimum: %.6f\n", distance_to_min);
  printf("Elapsed time: %.4f seconds\n", elapsed_time);
  printf("---\n");
endfor
