function Mom = CalcMom(theta, COB, COM)
%已知小船倾斜theta角度后的重心，浮心计算恢复力矩
rMon = COB - COM;
p = tan(theta);
Buo_val= volume * rho;%浮力Buoyancy
lambda = Buo_val / (p^2+1);
Buo = [p 0 1]*lambda;
Mom = sum(cross(rMon,Buo) );
end
