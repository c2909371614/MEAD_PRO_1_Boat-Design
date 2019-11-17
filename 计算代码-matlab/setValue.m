function [A, B, H, volume,V_all,M_all,rho,g,thetaL,thetaR] = setValue()
%[A, B, H, volume,V_all,M_all,rho,g,thetaL,thetaR]
%������С��ģ�͵Ļ���������λ��Ϊ�����Ƶ�λ
format short
H = 0.12;
% zg = H*4.1/(1.75+4.10);
Phw = 1;%height:width=PhwΪ�ߺͿ�ı�ֵ
A = Phw^2/H;
Plw = sqrt(2.5);%length:width=PlwΪ���Ϳ�ı�ֵ
B = A/Plw^2;
Mc = 0.321;%С��������
Ma =0.11;%Φ�˵�����
Mb = 0.766;%���������
M_all = Ma+Mb+Mc;
g = 9.8;
rho = 1 * 10^3;
volume = M_all / rho;
% h = 0.0635;
 V_all = 0;%vpa(CalcV_all(), 6);%����С��ȫ�������
thetaL =147.320 * pi/180; %Calc_theta_1();
thetaR =23.407 * pi/180;%Calc_theta_0(A,B,H,volume);
% COB_135 = [  0.0607, 0, 0.09736];
end