%二分求吃水线
clear
max_runtimes = 10000;
right_min = 10^-10;%精度
i=1;
format long;
m=1.116530727680065;
Hmax=0.2;
Hmin=0;
H=Hmin;
while (i<=max_runtimes)
    fprintf('This is %d th number calculate\n', i);
    fprintf('H is %.9f\n', H);
    f_float=get_V(H)*1000;
    if(f_float-m<-right_min)%大于最小精度
       if(Hmin<H)
           Hmin=H;
       end
    end
    if(f_float-m>right_min)%小于最小精度
       if(Hmax>H)
           Hmax=H;
       end
    end
    if(f_float-m>=-right_min && f_float-m<=right_min)
        break;
    end
    H=double((Hmin+Hmax)/2);
    i=i+1;
end
