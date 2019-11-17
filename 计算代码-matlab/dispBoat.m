%绘制船体优化后
function wLine = dispBoat(theta,z0)
[A, B, H] = setValue();
xc = 0;
yc = 0;
zc = H;
xr = sqrt(H/A);
yr = sqrt(H/B);
zr = H;
xUp = xr*0.5;
yUp = yr*0.5;
zUp = zr*0.5;
hold on;
xlabel('x');
ylabel('y');
zlabel('z');
[X, Y, Z] = ellipsoid(xc,yc,zc,xr,yr,zr,100);
Size = size(X);
colSize = Size(1);
z1 = Z;
z1(ceil(colSize/2 ) + 1:colSize, : ) = ones(size(z1(ceil(colSize/2 ) + 1:colSize, : ) ) )*H;
mesh(X,Y,z1,z1*0.5);
axis equal
axis([-xr-xUp xr+xUp -yr-yUp yr+yUp 0 zr+zUp]);
x = ones(colSize,1)*linspace(-xUp*3,xUp*3,Size(2) );
y = ones(colSize,1)*linspace(-yUp*3,yUp*3,Size(2) );
% theta = i * pi / 180;
p = tan(theta);%水面方程斜率
if nargin == 1%defalut z0
    if p < 0
        z0 = H + p*sqrt(H/A);%水面方程截距
    else
        z0 = H - p*sqrt(H/A);
    end
end
z2 = p*x+z0;
fprintf('z0 = %.4f\n',z0);
wLine = surf(x,y',z2);
axis([-xr-xUp xr+xUp -yr-yUp yr+yUp 0 zr+zUp]);
title(theta*180/pi);
% pause(1);
end