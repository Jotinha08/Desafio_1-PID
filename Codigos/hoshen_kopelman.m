function [labeled_matrix, num_clusters] = hoshen_kopelman(matrix)
    matrix = imbinarize(rgb2gray(matrix),"global");
    [rows, cols] = size(matrix);
    labeled_matrix = zeros(rows, cols);
    current_label = 1;
    labels = containers.Map('KeyType', 'double', 'ValueType', 'double');

    for i = 1:rows
        for j = 1:cols
            if matrix(i, j) == 1
                neighbors = [];
                if i > 1 && matrix(i-1, j) > 0
                    neighbors = [neighbors, matrix(i-1, j)];
                end
                if j > 1 && matrix(i, j-1) > 0
                    neighbors = [neighbors, matrix(i, j-1)];
                end

                if isempty(neighbors)
                    labeled_matrix(i, j) = current_label;
                    labels(current_label) = current_label;
                    current_label = current_label + 1;
                else
                    labeled_matrix(i, j) = min(neighbors);
                    for neighbor = neighbors
                        if neighbor ~= min(neighbors)
                            labels(neighbor) = min(neighbors);
                        end
                    end
                end
            end
        end
    end

    num_clusters = length(unique(cell2mat(values(labels))));
    for i = 1:rows
        for j = 1:cols
            if labeled_matrix(i, j) > 0
                labeled_matrix(i, j) = labels(labeled_matrix(i, j));
            end
        end
    end
end