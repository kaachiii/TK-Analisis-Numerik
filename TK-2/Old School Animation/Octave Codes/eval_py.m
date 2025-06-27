function [t_vals, y1_vals] = eval_py()
    % Buat vektor t dari 1 hingga 10 dengan interval 0.1
    t_vals = 1:0.1:11;
    y1_vals = zeros(size(t_vals));

    % Evaluasi py(t) untuk setiap t
    for i = 1:length(t_vals)
        t = t_vals(i);
        y1 = py(t);
        y1_vals(i) = y1;
    end
