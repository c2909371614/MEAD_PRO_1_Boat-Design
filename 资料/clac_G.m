clear;
format long
A=17656;
B=14.8;
H=0.2;
P=0.1458;
%fun=@(x,y) H-A*x.^4-B*y.^2;
xmin=0;
xmax=(H/A)^(1/4);
ymin=0;
ymax=@(x) (H-A*x.^4).^0.5;
fun=@(x,y) sqrt(1+16*A*A*x.^6+4*B*B*y.^2)+1;
Q=quad2d(fun,xmin,xmax,ymin,ymax)
Q*4*P+1.1
