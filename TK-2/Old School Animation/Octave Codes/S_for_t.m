function y = S_for_t(a, b, c, d, t_ori, t_pred)
  n = length(t_pred);
  y = zeros(n, 1);
  j = 1;
  for i=1:n
    while t_pred(i) > t_ori(j+1) && j < length(a)
      j = j+1;
    endwhile
    y(i) = a(j) + b(j)*(t_pred(i) - t_ori(j)) + c(j)*(t_pred(i) - t_ori(j))^2 + d(j)*(t_pred(i) - t_ori(j))^3;
  endfor

