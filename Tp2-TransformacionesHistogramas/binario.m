function LUT = binario(u)
in = 0:2333;
LUT = zeros(size(in));  % Inicializar LUT con ceros
LUT(u + 1:end) = 255;  % Asignar 255 (blanco) a los valores mayores o iguales al umbral
end
