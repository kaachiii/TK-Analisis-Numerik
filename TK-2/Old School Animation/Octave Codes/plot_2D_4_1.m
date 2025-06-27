function plot_2D_4_1()
  % Data asli
  t_data = 1:11;
  y_data = [132 ; 136 ; 149 ; 152 ; 149 ; 150 ; 143 ; 135 ; 126 ; 127 ; 135];

  % Interval t rapat
  t_vals = 1:0.1:11;

  % Evaluasi interpolasi menggunakan Natural Cubic Splines
  [a, b, c, d] = cubic_spline(t_data, y_data);
  yc_vals = S_for_t(a, b, c, d, t_data, t_vals);

  % Plot titik-titik data
  figure;
  plot(t_data, y_data, 'ko', 'MarkerFaceColor', 'r', 'DisplayName', 'Data Asli'); hold on;

  % Plot interpolasi natural cubic spline
  plot(t_vals, yc_vals, 'b-', 'LineWidth', 1.5, 'DisplayName', 'Interpolasi Natural Cubic Spline');

  % Label dan legenda
  xlabel('t (frame)');
  ylabel('y (pixel)');
  title('Plot Lintasan 2D p_y(t) dan p_{y,N}(t)');

  legend('Location', 'northwest');
  grid on;
end

