function [c, e] = search_c()
  A = poly_fourth_basis();
  y = get_y_inter();

  [U, bt] = EliminasiGauss(A, y);

  c = segitigaAtas(U, bt);
  e = A*c - y;
