function plot_2D()
  % Data asli
  t_data = 1:11;
  y_data = [132 136 149 152 149 150 143 135 126 127 135];

  % Interval t rapat
  t_vals = 1:0.1:11;

  % Evaluasi interpolasi derajat 9 (N-1) dan 10 (N)
  y1_vals = py(t_vals);
  yN_vals = pyN(t_vals);

  % Plot titik-titik data
  figure;
  plot(t_data, y_data, 'ko', 'MarkerFaceColor', 'r', 'DisplayName', 'Data Asli'); hold on;

  % Plot interpolasi derajat 9 (N-1)
  plot(t_vals, y1_vals, 'b-', 'LineWidth', 1.5, 'DisplayName', 'Interpolasi Derajat 9');

  % Plot interpolasi derajat 10 (N)
  plot(t_vals, yN_vals, 'g--', 'LineWidth', 1.5, 'DisplayName', 'Interpolasi Derajat 10');

  % Label dan legenda
  xlabel('t (frame)');
  ylabel('y (pixel)');
  title('Plot Lintasan 2D p_y(t) dan p_{y,N}(t)');

  legend('Location', 'northwest');
  grid on;
end

