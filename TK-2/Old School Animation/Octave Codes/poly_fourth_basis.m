function A = poly_fourth_basis()
  t=1:10;
  t=t';
  A = zeros(10);
  for i=1:10
    for j=1:10
      A(i, j) = (0.5*t(i) - 2.75)^(j-1);
    endfor
  endfor

