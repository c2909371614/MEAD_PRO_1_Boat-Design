function thetaL = Calc_thetaL()
%���ֲ��Ҽ����ˮ�߹��㣨-sqrt(H/A),0,H��ʱ�ĽǶ�thetaL
[A,~,H,volume] = setValue();
thetaMin = pi*91/180;
thetaMax = pi;
tol =10^-6;%����
runtimes = 100;%����������
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
        thetaMin = thetaL;%�Ƕȱ��res���if res > tol
    elseif rho < -tol
        thetaMax = thetaL;%�Ƕȱ�С��res ��С
    else
        break;
    end
end
end