

function res = CalcVwater(theta,x1,xMid,x2,z0)
%计算过点(x0,0,H)的船体水下的体积
[A, B, H, ~,~,~,~,~,thetaL,thetaR] = setValue();
syms x
p = tan(theta);
y0 = sqrt( (H - A*x.^2) / B);
funVol_0 = y0 .* (H-A*x.^2) - B/3*y0.^3;%(tan_theta .* x - 2/3*A*x.^2 + z0 - H / 3) .* z0;
funVol_1 = y0 .* (p*x+z0-A*x.^2) - B/3*y0.^3; 
funVol_2 = y0.*(H - p*x- z0);
if theta <= thetaR                                               %5
    res = 2*int(funVol_1,x2,x1);
elseif theta < pi/2                                             %4
    res = 2*int(funVol_1,x2,xMid) + 2*int(funVol_0,xMid,sqrt(H/A) );
elseif theta == pi/2                                            %3
    res = 2*int(funVol_0,xMid,sqrt(H/A) );
elseif theta < thetaL                                           %2
    res = 2*int(funVol_2,xMid,x1) + 2*int(funVol_0,x1,sqrt(H/A) );
else
    res = 2*int(funVol_0,-sqrt(H/A),x2)+2*int(funVol_2,x2,x1)+2*int(funVol_0,x1,sqrt(H/A) );
end
end