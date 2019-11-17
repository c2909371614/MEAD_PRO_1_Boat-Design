function diffWaterlin()
%����theta �� z0����ˮ��
filename = 'Waterline.xlsx';
T = readtable(filename);
z0 = T.z0;
Theta = T.theta*pi/180;
for i = 1:4
    hold on
    subplot(2,2,i);
    dispBoat( Theta(i), z0(i) );  
end
