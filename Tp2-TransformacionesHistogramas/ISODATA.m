function u = ISODATA(img)
umax = max(img(:));
umin = min(img(:));
umean = (umax+umin)/2;

h=histogram(img,256);
h1=h.Values(umin:umean);
i1=double(umin:umean);

u0=dot(h1, i1)/sum(h.Values(i1));

h2=h.Values(umean:umax);
i2=double(umean:umax);
u1=dot(h2, i2)/sum(h.Values(i2));

u = (u0+u1)/2;
end