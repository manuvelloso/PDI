function LUT = crop(a,b,c,o,bit)
in=0:bit;
LUT=c*in+o;
LUT(LUT<a)=0;
LUT(LUT>b)=255;
end