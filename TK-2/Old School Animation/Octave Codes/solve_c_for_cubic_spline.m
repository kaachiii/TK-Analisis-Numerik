function c = solve_c_for_cubic_spline(dt, dy)
  n = length(dt);
  A = zeros(n+1);
  A(1, 1) = A(n+1, n+1) = 1;
  b = zeros(n+1, 1);
  for i=1:n-1
    A(i+1, i) = dt(i);
    A(i+1, i+1) = 2*dt(i) + 2*dt(i+1);
    A(i+1, i+2) = dt(i+1);
  endfor
  for i=2:n
    b(i) = 3*(dy(i)/dt(i) - dy(i-1)/dt(i-1));
  endfor
  [U, bt] = EliminasiGauss(A, b);
  c = segitigaAtas(U, bt);

