function A = poly_first_basis()
  t = 1:10;
  t = t';
  A = zeros(10);
  for i=1:10
    for j=1:10
      A(i,j) = (t(i))^(j-1);
    endfor
  endfor

