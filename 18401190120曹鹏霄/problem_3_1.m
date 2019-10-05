function val = problem_3_1(x)
val(1)=2*x(1)-x(2)-exp(-x(1));
val(2)=-x(1)+2*x(2)-exp(-x(2));
end
fzero(x^3-6*x^2-72*x-72,2.5829)