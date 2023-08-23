function img = Operacion(img1, img2, op)
    alfa = 0.5;
    
    % Verificar que op sea un valor válido
    if op < 1 || op > 4
        error('Valor de op no válido.');
    end
    
    switch op
        case 1 % Suma
            img = img1 + img2;
        case 2 % Resta
            img = img1 - img2;
        case 3 % Promedio ponderado
            img = alfa * img1 + (1 - alfa) * img2;
        case 4 % Multiplicación elemento a elemento
            img = img1 .* img2;
        otherwise
            error('Operación no reconocida.');
    end
end
