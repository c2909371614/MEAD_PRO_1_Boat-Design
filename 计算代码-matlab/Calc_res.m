% [A, B, H, volume,V_all,M_all,rho,g,thetaL,thetaR] = setValue();
% Mc = 0.321;
% Ma =0.11;
% Mb = 0.766;
% COMc_z = 0.08;
% COB_135 = [  0.0607, 0, 0.09736];
% COG = [ 0 0 0.05277];
% M_all = Ma + Mb + Mc;
% Cz = 0.08;
% Ra = 0.005;
% Rb = 0.02;
% Zb = ( COG(3)*M_all - Cz*Mc - Ra*Ma - Rb*Ma) / ( Mb + Ma);
% fprintf('重物重心 Zb = %.5f\n', Zb);
mAndCOG();
function mAndCOG()
Mc = 0.321;
Ma =0.11;
% Mb = 0.766;
Zb = 0.0424;
Za = 0.0224+0.02+0.25;
Zc = 0.08;
Mb = linspace(0,0.766,10);
Size = size(Mb);
Z_all  = linspace(1,1,Size(2) );
for i = 1: Size(2)
Z_all(i) = (Ma*Za+Mb(i)*Zb+Mc*Zc)/(Mc+Ma+Mb(i));
end
hold on;
plot(Mb,Z_all,'r*');
plot(Mb,Z_all);
xlabel('重物质量m/kg');
ylabel('重心z轴坐标/m');
title('重物质量与重心曲线关系图');
end




