function Res = CalcV_all(H)
%计算船的总体积
[A,B] = setValue();
if nargin == 0
    [~,~,H] = setValue;
end
syms x
y0 = sqrt( (H - A*x.^2)/B);
VolMin = vpa(-sqrt(H/A),4);
VolMax =  vpa(sqrt(H/A),4);
funVol = (H-A*x.^2) .* y0 - y0.^3 * B/3;
Res = 2*int(funVol,VolMin,VolMax);
end