function COB = Calc_COB(theta,x1,xMid,x2,z0)
format short
p = tan(theta);
[A, B, H, volume,~,~,~,~,thetaL,thetaR] = setValue();
syms x;
  
y0 = sqrt( (H - A*x.^2) / B);

xbFun_0 = x.*(y0.*(H-A*x.^2)-B/3*y0.^3);
xbFun_1 = x.*(y0.*(p*x+z0-A*x.^2)-B/3*y0.^3);%1/4*y0.^2 .* ( (p*x+z0).^2-Z.^2- 8*B*Z);
xbFun_2 = x.*(H-p*x-z0).*y0;
zbFun_0 =1/2*y0 .* ( H.^2 - A^2*x.^4 - 2/3*A*B*x.^2.*y0.^2 - 1/5*B^2*y0.^4 );
zbFun_1 =1/2*y0 .* ( (p*x+z0).^2 - A^2*x.^4 - 2/3*A*B*x.^2.*y0.^2 - 1/5*B^2*y0.^4 );
zbFun_2 = 1/2*y0 .* (H^2-(p*x+z0).^2);
if theta < thetaR                                                                                                  %5
    xb = 2*int(xbFun_1,x2,x1);
    zb = 2*int(zbFun_1,x2,x1);
elseif theta < pi/2                                                                                               %4
    xb = 2*int(xbFun_1,x2,xMid)+2*int(xbFun_0,xMid,sqrt(H/A) );
    zb = 2*int(zbFun_1,x2,xMid)+2*int(zbFun_0,xMid,sqrt(H/A) );
elseif theta == pi/2                                                                                            %3
    xb = 2*int(xbFun_0,xMid,sqrt(H/A) );
    zb = 2*int(zbFun_0,xMid,sqrt(H/A) );
elseif theta < thetaL                                                                                          %2
    xb = 2*int(xbFun_2,xMid,x1)+2*int(xbFun_0,x1,sqrt(H/A) );
    zb = 2*int(zbFun_2,xMid,x1)+2*int(zbFun_0,x1,sqrt(H/A) );
else                                                                                                                   %1
    xb = 2*int(xbFun_0,-sqrt(H/A),x2 )+2*int(xbFun_2,x2,x1)+2*int(xbFun_0,x1,sqrt(H/A) );
    zb = 2*int(zbFun_0,-sqrt(H/A),x2 )+2*int(zbFun_2,x2,x1)+2*int(zbFun_0,x1,sqrt(H/A) );
end
fprintf('%.6f-%.6f  %.6f-%.6f-%.6f\n',xb,zb,x1,xMid,x2);
COB = vpa([xb 0 zb]/volume , 6);
end