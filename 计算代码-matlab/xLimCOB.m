function xLim3 = xLimCOB(theta,x1,xMid,x2)
[A,~,H,volume,V_all,~,~,~,thetaL,thetaR] = setValue();
tol = 10^-6;%精度
runtimes = 100;
precision = 6;%分数转小数保留的位数
if nargin == 1
    x1 = 0;%初始化x1作为5的第一次迭代下界
    x2 = -sqrt(H/A);%初始化x2作为1的第一次迭代下界
    xMid = sqrt(H/A);
end
xLim3 = [x1 xMid x2];
% fileID =fopen('迭代信息.txt','w');
cnt = 0;
res = 100;
 p = tan(theta);
if theta > thetaL                            %1
    xMax = sqrt(H/A);
    xMin = 0;%DP
    fprintf('1：');
    while abs(res) > tol && cnt < runtimes
        cnt=cnt+1;
%         fprintf('xMax xMin: %4.f %4.f\n',xMax,xMin);
        x1 = (xMax+xMin)/2;
%         fprintf('x1 = %.4f\n',x1);
        xLim = Calc_xLim(theta,false,x1);%函数中进行了分段
        x1 = xLim(1);
        x2 = xLim(2);
%         xMid = xMid;
        z0 = -A*xLim(1)*xLim(2);
        res = real( CalcVwater(theta,x1,xMid,x2,z0) )-volume;%res 为当前V-V排
        if res > tol%waterVolme大了 需将x1变大增大积分范围
            xMin = x1;
        elseif res < -tol
            xMax = x1;
        end
%         fprintf(fileID,'x1 = %.4f xMid = %.8f  x2 = %.4f res = %.6f\n',x1,xMid,x2,res);
%         fprintf('x1 = %.4f xMid = %.8f  x2 = %.4f res = %.6f\n',x1,xMid,x2,res);

    end
elseif theta > pi/2                         %2
    fprintf('2：');
    xMidMax = xMid; 
    xMidMin = -sqrt(H/A);
    while abs(res) > tol && cnt < runtimes
        cnt=cnt+1;
        xMid = (xMidMin+xMidMax) / 2;
        xLim = Calc_xLim(theta,false,xMid);
        x1 = xLim(1);
        z0 = H - p*xMid;
        Vdown = CalcVwater(theta,x1,xMid,x2,z0);
        res = Vdown - volume; 
          if res < -tol %体积太小将xMid变小
            xMidMax = xMid;
        elseif res > tol
            xMidMin = xMid;
          end
%             fprintf(fileID,'x1 = %.4f xMid = %.8f res = %.6f\n',x1,xMid,res);
    end
elseif theta == pi/2                       %3
    xMax = -sqrt(H/A);
    xMin = -sqrt(H/A);
    fprintf('3：');
    while abs(res) > tol && cnt < runtimes
        cnt=cnt+1;
        xMid = (xMax+xMin) / 2;
        xLim = [sqrt(A/H) xMid];
        res = CalcVwater(theta,x1,xMid,x2,z0) - volume;
        if res < -tol%V_down小了 需将xMid变小增大积分范围
            xMax = xMid;
        elseif res > tol
            xMin = xMid;
        end
    end
elseif theta > thetaR                      %4
    fprintf('4：');
    xMidMax = xMid; 
    xMidMin = -sqrt(H/A);
    while abs(res) > tol && cnt < runtimes
        cnt=cnt+1;
        xMid = (xMidMax+xMidMin) / 2;
        xLim = Calc_xLim(theta,false,xMid);
        x2 = xLim(2);
        z0 = H - p*xMid;
        Vdown = CalcVwater(theta,x1,xMid,x2,z0);
        res = Vdown - volume;
        res = vpa(res,precision);
        if res > tol %体积太大将x1增大
            xMidMin = xMid;
        elseif res <- tol
            xMidMax = xMid;
        end
%          fprintf(fileID,'xMid = %.8f res = %.6f\n',xMid,res);
    end
  
else                                                %5
    xMax = sqrt(H/A);
    xMin = x1;%0;动态规划思想
    fprintf('5：');
    while abs(res) > tol && cnt < runtimes
        cnt=cnt+1;
        xMid = (xMax+xMin) / 2;
        xLim = Calc_xLim(theta,false,xMid);%函数中进行了分段
        z0 = -A*xLim(1)*xLim(2);
        res = CalcVwater(theta,x1,xMid,x2,z0)-volume;%res 为当前V-V排
        if res < -tol%V_down小了 需将x1变大增大积分范围
            xMin = xMid;
        elseif res > tol
            xMax = xMid;
        else
            break;
        end
       
%         fprintf(fileID,'xMid = %.8f res = %.6f\n',xMid,res);
    end
    x1 = xMid;
end
xLim3 = [x1 xMid xLim(2)];
%     fprintf('%d-th xMid = %.4f xMid = %.8f\n',i,xMid,xMid);
end