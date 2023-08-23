function LUT = slice(a,b,c,o,bit)
in = 0:bit;
LUT = zeros(size(in));
LUT(a:b) = c*(a:b)+o;
end