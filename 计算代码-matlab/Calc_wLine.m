function Calc_wLine()
%������бʱС���ĳ�ˮ��
[~, ~, H, volume] = setValue();%����С��ģ�Ͳ���
hMin = 0;%���õ�������
hMax = H;
tol = 10^-6;%����
runtimes = 100;%���Ƶ�����������ֹ��ѭ��
i = 0;
while i <=  runtimes
    i = i+1;
    h = (hMin +hMax) / 2;
    res = CalcV_all(h); 
    res = res - volume;
    if res > tol%������������Сhʹ���������С
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