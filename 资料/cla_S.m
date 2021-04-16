clear
syms x y
A = 17656;
B = 14.8;
H = 0.2;
p = 0.1458; 
z = A.*x.^4+B.*y.^2;
xmin = 0;
xmax= (H/A)^(1/4);
ymin = 0;
ymax = @(x) sqrt((H - A.*x.^4)./B);
FUN = @(x ,y)  sqrt(1+(4.*A.*x.^3).^2+(2.*B.*y).^2)+1
Q = quad2d(FUN, xmin, xmax, ymin, ymax)
Q*4
Q.*4.*p+1.1
%dblquad(FUN, 0,((H-B*y^2)/4)^0.25,0, sqrt(H/B))
%quad2d
%f=int(sqrt(1+(4*A*x^3)^2+(2*B*y)^2), y, 0, sqrt(H/B))
%int(f, x, 0, (H/A)^0.25)