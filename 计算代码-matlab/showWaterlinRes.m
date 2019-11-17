% function showWaterlinRes()
%计算并画出重物与吃水线的关系图
clear
Ma =0.110;%桅杆
Mb = 0.321;%船体
% Mc = 0.770;%重物
[A,B] = setValue();
h = linspace(0, 0.063,10);
sizeH = size(h);
% syms x
% y0 = sqrt( (h - A*x.^2)/B); 

res = linspace(1,1,10);
rho = 1e3;%水的密度
for i = 1:sizeH(2)
%     VolMin = -sqrt(h(i) / A);
%     VolMax =  sqrt(h(i) / A);
%     funVol = (h(i) - A*x.^2) .* y0 - y0.^3 * B/3;
%     aa = rho*2*int(funVol,VolMin,VolMax)
res(i) = rho * CalcV_all_( h(i) );
end
res = res - Ma - Mb;
% size(h)
% size(res)
plot(res,h,'b--');
xlabel('重物质量Mb/kg');
ylabel('吃水线高度h/m');
title('重物质量与吃水线关系曲线图');
% end

function res = CalcV_all_(H)
[A,B] = setValue();
% H = 0.0635;
syms x
y0 = sqrt( (H - A*x.^2)/B);
VolMin = vpa(-sqrt(H/A),4);
VolMax =  vpa(sqrt(H/A),4);
funVol = (H-A*x.^2) .* y0 - y0.^3 * B/3;
res = 2*int(funVol,VolMin,VolMax);
end