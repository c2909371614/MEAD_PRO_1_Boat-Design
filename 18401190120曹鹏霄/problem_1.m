%数据
source_val = [20 20];%A B
source_a = [5 2];%A B的pos_a
source_b = [1 7];%pos_b
pos_a = [1.25 8.75 0.5 5.75 3 7.25];
pos_b = [1.25 0.75 4.75 5 6.5 7.25];
d     = [3 5 4 7 6 11];
%运算
syms from_A
% from_B = d - from_A;
% sum(from_A) <= source_val(1);%限制条件
% sum(from_B) <= source_val(2);
dis_A = sqrt((source_a(1) - pos_a).^2 + (source_b(1) - pos_b).^2);
dis_B = sqrt((source_a(2) - pos_a).^2 + (source_b(2) - pos_b).^2);
W = dis_A .* from_A + dis_B .* from_B;%目标最小值
A = [1 1 1 1 1 1];
b = [20];
f = dis_A - dis_B;
Aeq = [];
Beq = [];
lb = zeros(6,1);
ub = d;
[from_A W] = linprog(f,A,b,Aeq,Beq,lb,ub);
from_A = from_A';
from_B = d - from_A;
W = dis_A .* from_A + dis_B .* from_B;
W = sum(W);
xlswrite('promble_1.xlsx',from_A,1,'B2');
xlswrite('promble_1.xlsx',from_B,1,'B3');
xlswrite('promble_1.xlsx',W,1,'B4');
