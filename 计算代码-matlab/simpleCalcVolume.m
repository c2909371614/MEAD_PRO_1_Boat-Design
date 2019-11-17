%计算得出小船的总体积、长、宽、高和左右两边的特殊角[thetaR thetaL]
format short;

[A, B, H, volume,~,M_all,rho,g] = setValue();
length = sqrt(H / B);
width = sqrt(H / A);
V_all = CalcV_all();%计算小船全部的体积
%---求船型重心--
syms x
y0 = sqrt( (H - A*x.^2) / B);
funZg = y0.*( H^2 - A^2*x.^4) - 2/3*A*B*x.^2.*y0.^3 - B^2*y0.^5/5 ; 
ZgMin  = -sqrt(H / A);
ZgMax =   sqrt(H / A);
Zg = int(funZg, ZgMin, ZgMax)/V_all;
fprintf('V_all = %.5f length =  %.5fm width = %.5fm height = %.5fm\n',V_all,2*length, 2*width, H);
fprintf('COM (0, 0, %.3f)\n',Zg);

thetaR=Calc_thetaR() * 180/pi;
thetaL=Calc_thetaL() * 180/pi;
fprintf('thetaR = %.2f° thetaL = %.2f°\n', thetaR, thetaL);
