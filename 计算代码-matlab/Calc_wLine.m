function Calc_wLine()
%求无倾斜时小船的吃水线
[~, ~, H, volume] = setValue();%导入小船模型参数
hMin = 0;%设置迭代区间
hMax = H;
tol = 10^-6;%精度
runtimes = 100;%限制迭代最大次数防止死循环
i = 0;
while i <=  runtimes
    i = i+1;
    h = (hMin +hMax) / 2;
    res = CalcV_all(h); 
    res = res - volume;
    if res > tol%积分区域过大减小h使积分区域减小
        hMax = h;
    elseif res < -tol
        hMin = h;
    else  
        break;
    end
end
% fprintf('res = %.5f volume = %.5f\n', res+volume,volume);
fprintf('waterline = %.5fm \n', h);
end