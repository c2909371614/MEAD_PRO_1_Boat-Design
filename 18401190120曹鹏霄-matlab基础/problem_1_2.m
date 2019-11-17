%Êý¾Ý
function f = problem_1_2(p) 
% source_val = [20 20];%A B
% source_a = [5 2];%A BµÄpos_a
% source_b = [1 7];%pos_b
% syms x y
x = p(1);
y = p(2);
pos_a = [1.25 8.75 0.5 5.75 3 7.25];
pos_b = [1.25 0.75 4.75 5 6.5 7.25];
d     = [3 5 4 7 6 11];
% sqrt((x - pos_a).^2 + (y - pos_b).^2)
dis = sqrt((x - pos_a).^2 + (y - pos_b).^2);
f = sum(dis.*d);
end
