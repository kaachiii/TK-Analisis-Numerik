% Inisialisasi parameter
theta0 = 10;
gamma = 0.1;
beta1 = 0.9;
beta2 = 0.999;
lambda = 0;
amsgrad = false;
maximize = false;
T = 100;
epsilon = 1e-8;

% Definisikan fungsi gradien
function gradient = grad_func(theta)
  gradient = 2 * theta;
endfunction

% Definisikan Adam Optimizer
function theta = adam_optimizer(theta0, grad_func, gamma, beta1, beta2, lambda, amsgrad, maximize, T, epsilon)

  % Inisialisasi variabel
  theta = theta0;
  m = zeros(size(theta0)); % Momen pertama
  v = zeros(size(theta0)); % Momen kedua

  if amsgrad
    vmax = zeros(size(theta0)); % Momen kedua maksimum untuk AMSGrad
  endif

  % Iterasi untuk T steps
  for t = 1:T
    % Hitung gradien theta
    theta_grad = grad_func(theta);

    if maximize
      theta_grad = -theta_grad; % Negasi gradien untuk maximize
    endif

    if lambda ~= 0
      theta_grad = theta_grad + lambda * theta; % Weight decay
    endif

    % Perbarui momen
    m = beta1 * m + (1 - beta1) * theta_grad;
    v = beta2 * v + (1 - beta2) * (theta_grad .^ 2); % Element-wise square

    % Perbaiki momen berdasarkan bias
    m_hat = m / (1 - beta1^t);
    v_hat = v / (1 - beta2^t);

    % Perbarui parameter
    if amsgrad
      v_max = max(v_max, v_hat); % Element-wise maximum
      theta = theta - gamma * m_hat ./ (sqrt(v_max) + epsilon);
    else
      theta = theta - gamma * m_hat ./ (sqrt(v_hat) + epsilon);
    endif

  endfor

endfunction

% Jalankan Adam Optimizer
printf("Parameter initial:\n")
printf("theta0 = 10\n")
printf("gamma = 0.1\n")
printf("beta1 = 0.9\n")
printf("lambda = 0\n")
printf("amsgrad = false\n")
printf("maximize = false\n")
printf("T = 100\n")
printf("epsilon = 1e-8\n")
printf("\n")
optimized_theta = adam_optimizer(theta0, @grad_func, gamma, beta1, beta2, lambda, amsgrad, maximize, T, epsilon);
disp(['Optimized theta: ', num2str(optimized_theta)]);


