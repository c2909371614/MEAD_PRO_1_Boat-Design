function thetaR = Calc_thetaR()
%���ֲ��Ҽ����ˮ�߹��㣨sqrt(H/A),0,H��ʱ�ĽǶ�thetaR
[A,~,H,volume] = setValue();
thetaMin = 0;
thetaMax = pi*57/180;
tol = 10^-6;%����
runtimes = 100;%����������
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
        thetaMax = thetaR;%�Ƕȱ�С��res���
    elseif res > tol
        thetaMin = thetaR;%�Ƕȱ��res��С
    else
        break;
    end
end
end