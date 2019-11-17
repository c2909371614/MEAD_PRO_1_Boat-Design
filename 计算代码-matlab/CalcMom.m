function Mom = CalcMom(theta, COB, COM)
%��֪С����бtheta�ǶȺ�����ģ����ļ���ָ�����
rMon = COB - COM;
p = tan(theta);
Buo_val= volume * rho;%����Buoyancy
lambda = Buo_val / (p^2+1);
Buo = [p 0 1]*lambda;
Mom = sum(cross(rMon,Buo) );
end
