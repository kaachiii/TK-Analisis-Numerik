function [a, b, c, d] = cubic_spline(t, y)
  n = length(t);
  a = b = c = d = dt = dy = zeros(n-1, 1);
  for i=1:n-1
    a(i) = y(i);
    dt(i) = t(i+1) - t(i);
    dy(i) = y(i+1) - y(i);
  endfor

  c = solve_c_for_cubic_spline(dt, dy);

  for i=1:n-1
    d(i) = (c(i+1) - c(i)) / (3 * dt(i));
    b(i) = dy(i)/dt(i) - dt(i)/3*(2*c(i) + c(i+1));
  endfor

