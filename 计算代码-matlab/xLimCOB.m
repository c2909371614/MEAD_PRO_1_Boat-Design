function xLim3 = xLimCOB(theta,x1,xMid,x2)
[A,~,H,volume,V_all,~,~,~,thetaL,thetaR] = setValue();
tol = 10^-6;%����
runtimes = 100;
precision = 6;%����תС��������λ��
if nargin == 1
    x1 = 0;%��ʼ��x1��Ϊ5�ĵ�һ�ε����½�
    x2 = -sqrt(H/A);%��ʼ��x2��Ϊ1�ĵ�һ�ε����½�
    xMid = sqrt(H/A);
end
xLim3 = [x1 xMid x2];
% fileID =fopen('������Ϣ.txt','w');
cnt = 0;
res = 100;
 p = tan(theta);
if theta > thetaL                            %1
    xMax = sqrt(H/A);
    xMin = 0;%DP
    fprintf('1��');
    while abs(res) > tol && cnt < runtimes
        cnt=cnt+1;
%         fprintf('xMax xMin: %4.f %4.f\n',xMax,xMin);
        x1 = (xMax+xMin)/2;
%         fprintf('x1 = %.4f\n',x1);
        xLim = Calc_xLim(theta,false,x1);%�����н����˷ֶ�
        x1 = xLim(1);
        x2 = xLim(2);
%         xMid = xMid;
        z0 = -A*xLim(1)*xLim(2);
        res = real( CalcVwater(theta,x1,xMid,x2,z0) )-volume;%res Ϊ��ǰV-V��
        if res > tol%waterVolme���� �轫x1���������ַ�Χ
            xMin = x1;
        elseif res < -tol
            xMax = x1;
        end
%         fprintf(fileID,'x1 = %.4f xMid = %.8f  x2 = %.4f res = %.6f\n',x1,xMid,x2,res);
%         fprintf('x1 = %.4f xMid = %.8f  x2 = %.4f res = %.6f\n',x1,xMid,x2,res);

    end
elseif theta > pi/2                         %2
    fprintf('2��');
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
          if res < -tol %���̫С��xMid��С
            xMidMax = xMid;
        elseif res > tol
            xMidMin = xMid;
          end
%             fprintf(fileID,'x1 = %.4f xMid = %.8f res = %.6f\n',x1,xMid,res);
    end
elseif theta == pi/2                       %3
    xMax = -sqrt(H/A);
    xMin = -sqrt(H/A);
    fprintf('3��');
    while abs(res) > tol && cnt < runtimes
        cnt=cnt+1;
        xMid = (xMax+xMin) / 2;
        xLim = [sqrt(A/H) xMid];
        res = CalcVwater(theta,x1,xMid,x2,z0) - volume;
        if res < -tol%V_downС�� �轫xMid��С������ַ�Χ
            xMax = xMid;
        elseif res > tol
            xMin = xMid;
        end
    end
elseif theta > thetaR                      %4
    fprintf('4��');
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
        if res > tol %���̫��x1����
            xMidMin = xMid;
        elseif res <- tol
            xMidMax = xMid;
        end
%          fprintf(fileID,'xMid = %.8f res = %.6f\n',xMid,res);
    end
  
else                                                %5
    xMax = sqrt(H/A);
    xMin = x1;%0;��̬�滮˼��
    fprintf('5��');
    while abs(res) > tol && cnt < runtimes
        cnt=cnt+1;
        xMid = (xMax+xMin) / 2;
        xLim = Calc_xLim(theta,false,xMid);%�����н����˷ֶ�
        z0 = -A*xLim(1)*xLim(2);
        res = CalcVwater(theta,x1,xMid,x2,z0)-volume;%res Ϊ��ǰV-V��
        if res < -tol%V_downС�� �轫x1���������ַ�Χ
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