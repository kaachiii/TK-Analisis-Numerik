function A = poly_second_basis()
  t=1:10;
  t=t';
  A = zeros(10);
  for i=1:10
    for j=1:10
      A(i, j) = (t(i) - 5.5)^(j-1);
    endfor
  endfor

