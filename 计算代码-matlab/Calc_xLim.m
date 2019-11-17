
function xLim = Calc_xLim(theta, option, x0)
%when option == true Calc the thetaL and thetaR
%when option == false Calc the waterline x1 and x2
[A, ~, H, ~,~,~,~,~,thetaL,thetaR] = setValue();
% fprintf('x0 = %.4f\n',x0);
p = tan(theta);
if nargin < 2
    option = true;
else
    Delta = p^2-4*A*(p*x0 - H);
end
if option%Calc the thetaL and thetaR
    if theta < pi/2
        xLim(1) = sqrt(H / A);
        xLim(2) = p / A - xLim(1);
    else
        xLim(2) = -sqrt(H / A);
        xLim(1) = p / A - xLim(2);
    end
else
    %Calc the waterline x1 and x2               1
    if theta > thetaL%thetaL~pi
        xLim(1) = x0;
        xLim(2) = p/A - xLim(1);
    elseif theta > pi/2%pi/2~thetaL             2
        xLim(2) = x0;
        xLim(1) = (p+sqrt(Delta) ) / (2*A);
    elseif theta == pi/2%pi/2                       3
        xLim(1) = sqrt(H/A);
        xLim(2) = x0;
    elseif theta > thetaR %thetaR~pi/2         4
        xLim(1) = x0;
        xLim(2) = (p-sqrt(Delta) ) / (2*A);
    else                                                   %   5
        xLim(1) = x0;%sqrt(H / A);
        xLim(2) = p / A - xLim(1);
    end
end
% disp(xLim);
% (p-sqrt(Delta) ) / (2*A)
% (p+sqrt(Delta) ) / (2*A)
end