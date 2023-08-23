%% CONTRAST STRETCHING

function LUT = ContrastStreching(a,b,h)
c1=h.Values(a)/a;
c2=(h.Values(a)-h.Values(b))/(a-b);
c3=(h.Values(b)-255)/(b-255);

b2=h.Values(a)-c2*a;
b3=h.Values(b)-c3*b;

in=0:255;

LUT1 = c1*in(1:a);
LUT2 = c2*in(a:b) + b2;
LUT3 = c3*in(b:256) + b3;

LUT = [LUT1 LUT2 LUT3];
end
