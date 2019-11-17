function thetaR = Calc_thetaR()
%二分查找计算吃水线过点（sqrt(H/A),0,H）时的角度thetaR
[A,~,H,volume] = setValue();
thetaMin = 0;
thetaMax = pi*57/180;
tol = 10^-6;%精度
runtimes = 100;%最大迭代次数
i = 0;
syms x;
while i <= runtimes
    i=i+1;
    thetaR = (thetaMin+thetaMax) / 2;
    xLim = Calc_xLim(thetaR);
    z0 = -A*xLim(1)*xLim(2);
    res = CalcVwater(thetaR, xLim(1), sqrt(H/A), xLim(2), z0);
    res = res - volume;
    if res < -tol
        thetaMax = thetaR;%角度变小，res变大
    elseif res > tol
        thetaMin = thetaR;%角度变大，res变小
    else
        break;
    end
end
end