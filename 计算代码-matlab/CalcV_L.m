function res = CalcV_L(xMid)
[A,B,H] = setValue();
syms x;
y0 = sqrt((H-A*x.^2)/B );
VolMax = xMid;
VolMin = -sqrt(H/A);
funVol = y0 .* (H-A*x.^2);
res = 2*int(funVol,VolMin,VolMax);
end
