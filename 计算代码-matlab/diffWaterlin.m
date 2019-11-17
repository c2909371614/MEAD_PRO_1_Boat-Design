function diffWaterlin()
%根据theta 和 z0绘制水面
filename = 'Waterline.xlsx';
T = readtable(filename);
z0 = T.z0;
Theta = T.theta*pi/180;
for i = 1:4
    hold on
    subplot(2,2,i);
    dispBoat( Theta(i), z0(i) );  
end
