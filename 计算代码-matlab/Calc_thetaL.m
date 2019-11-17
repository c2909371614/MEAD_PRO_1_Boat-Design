function thetaL = Calc_thetaL()
%二分查找计算吃水线过点（-sqrt(H/A),0,H）时的角度thetaL
[A,~,H,volume] = setValue();
thetaMin = pi*91/180;
thetaMax = pi;
tol =10^-6;%精度
runtimes = 100;%最大迭代次数
i = 0;
syms x;
while i <= runtimes
    i=i+1;
    thetaL = (thetaMin+thetaMax) / 2;
    xLim = Calc_xLim(thetaL);
    z0 = -A*xLim(1)*xLim(2);
    res = CalcVwater(thetaL,xLim(1), -sqrt(H/A), xLim(2), z0);
    rho = real(vpa(res - volume, 4) );
    if rho > tol
        thetaMin = thetaL;%角度变大，res变大if res > tol
    elseif rho < -tol
        thetaMax = thetaL;%角度变小，res 变小
    else
        break;
    end
end
end