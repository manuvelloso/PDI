function u = OTSU(img)    
% Calcular el histograma de la imagen
h = imhist(img);
    
total_pixeles = numel(img);
prob = h / total_pixeles;
    
sum_acum = cumsum(prob);
    
i = (0:255)';
    
media_total = dot(i, prob);
    
varianza_entre_clases = ((media_total * sum_acum - sum_acum.^2).^2) ./ (sum_acum .* (1 - sum_acum));
    
max_varianza = max(varianza_entre_clases);
u = find(varianza_entre_clases == max_varianza, 1) - 1;
end
