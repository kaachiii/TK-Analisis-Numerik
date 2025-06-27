function [t, y] = eval_pyN()
    % Buat vektor t dari 1 hingga 10 dengan interval 0.1
    t = 1:1:11;
    y = zeros(size(t));

    % Evaluasi pyN(t) untuk setiap t
    for i = 1:length(t)
        t_vals = t(i);
        y_vals = pyN(t_vals);
        y(i) = y_vals;
    end
