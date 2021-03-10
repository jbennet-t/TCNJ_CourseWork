%part 6
N = 256;
n = 0:(N-1);

y1 = sin((2*pi*n)/N);
y2 = cos((4*pi*n)/N);
y3 = cos((22*pi*n)/N);
y4 = cos((202*pi*n)/N);

y = y1 + y2 + y3 + y4;

figure
stem(n,y)
xlabel('n')
title('y')
xlim([0 N-1])
