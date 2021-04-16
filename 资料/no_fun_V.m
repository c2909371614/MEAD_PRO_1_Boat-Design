format long
H=0.2;
A=17656;
B=14.8;
xmin=0;
xmax=(H/A)^0.25;
y=@(x) (H-A*x.^4).^1.5;
f=quad(y,xmin,xmax);  
f=f*8/(3*sqrt(B))