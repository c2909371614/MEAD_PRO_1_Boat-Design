function [A, B, H, volume,V_all,M_all,rho,g,thetaL,thetaR] = setValue()
%[A, B, H, volume,V_all,M_all,rho,g,thetaL,thetaR]
%定义了小船模型的基本参数单位均为国际制单位
format short
H = 0.12;
% zg = H*4.1/(1.75+4.10);
Phw = 1;%height:width=Phw为高和宽的比值
A = Phw^2/H;
Plw = sqrt(2.5);%length:width=Plw为长和宽的比值
B = A/Plw^2;
Mc = 0.321;%小船的质量
Ma =0.11;%桅杆的质量
Mb = 0.766;%重物的质量
M_all = Ma+Mb+Mc;
g = 9.8;
rho = 1 * 10^3;
volume = M_all / rho;
% h = 0.0635;
 V_all = 0;%vpa(CalcV_all(), 6);%计算小船全部的体积
thetaL =147.320 * pi/180; %Calc_theta_1();
thetaR =23.407 * pi/180;%Calc_theta_0(A,B,H,volume);
% COB_135 = [  0.0607, 0, 0.09736];
end