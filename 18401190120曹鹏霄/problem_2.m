
syms t
k = log(2)/20;
sum = int(10*t-t^2,0,5)+int(25*exp(-k*(t-5)),5,60);
c = eval(sum/60)