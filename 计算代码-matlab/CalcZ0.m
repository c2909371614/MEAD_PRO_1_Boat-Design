% function z0 = CalcZ0(xLim)
%���������ֵ������� ��x1 xMid x2���� ˮ�淽�̽ؾ�
%���ɵõ�ˮ�淽��
clear
[A, B, H, volume,~,~,~,~,thetaL,thetaR] = setValue();
stepAngle = 20;
lenX = length(1:stepAngle:179);
z0 = zeros(lenX,1);
xLimData = zeros(lenX,3);
x1 = sqrt(H/A);
x2 = -sqrt(H/A);  
xMid = sqrt(H/A);
Angle = [15 50 125 178]*pi/180;
for i = 4:4%enX
    theta = Angle(i);%135*pi/180;%(5 + (i-1)*stepAngle)*pi/180;
    if i == 1
        xLim = xLimCOB(theta);
    else
        xLim = xLimCOB(theta,x1,xMid,x2);
    end
    p = tan(theta);
    %x1 xMid x2 �ֱ�Ϊˮ����
    x1 = xLim(1);
    xMid = xLim(2);
    x2 = xLim(3);
    if theta < thetaR                       %5. ����б�Ƕ�С��theta_0������ˮ���봬�����ཻ
        z0(i) = -A*x1*x2;
    elseif theta <pi/2                     %4. ����б�Ƕȴ���theta_0С��90�㣬����ˮ���봬�װ��ཻ
        z0(i) = H - p*xMid;
    elseif theta == pi/2                 %3. ����б�Ƕ�Ϊ90��
        z0(i) = x2;
    elseif theta <thetaL                 %2. ����б�Ƕ�С��theta_1����90�㣬����ˮ���봬�װ��ཻ
        z0(i) = H - p*xMid;
    elseif theta < pi                       %1. ����б�Ƕ�С��theta_0������ˮ���봬�����ཻ
        z0(i) = -A*x1*x2;
    end
    xLimData(i, : ) = [ x1 xMid x2];
    
    fprintf('%.6f-%.6f-%.6f\n',x1,xMid,x2);
end