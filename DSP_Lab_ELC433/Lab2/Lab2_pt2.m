%part 2
alpha = 0.95;
t = linspace(0,199,200);  
Ts = 1.0e-3; 
x = alpha.^(1000*t*Ts);

figure 
stem(0:199,x,'filled','MarkerSize',2)
xlabel('Index x')
title(sprintf('%0.2f^n', alpha))
xlim([0 200])


