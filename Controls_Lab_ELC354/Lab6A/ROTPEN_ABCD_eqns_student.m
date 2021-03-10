% State Space Representation
% A = eye(4,4);
% B = [0;0;0;1];'

Jt = Jr*Jp + Mp*(Lp/2)^2*Jr + Jp*Mp*Lr^2; 
A = [0 0                            1                       0;
    0 0                            0                       1;
    0 Mp^2*(Lp/2)^2*Lr*g/Jt        -Dr*(Jp+Mp*(Lp/2)^2)/Jt  -Mp*(Lp/2)*Lr*Dp/Jt;
    0 Mp*g*(Lp/2)*(Jr+Mp*Lr^2)/Jt  -Mp*(Lp)*Lr*Dr/Jt       -Dp*(Jr+Mp*Lr^2)/Jt];

B = [0; 0; (Jp+Mp*(Lp/2)^2)/Jt; Mp*(Lp/2)*Lr/Jt]; 
C = eye(2,4);

D = zeros(2,1);
% Add actuator dynamics

B = Kg * kt * B / Rm;
A(4,3) = A(4,3) - Kg^2*kt*km/Rm*B(4) -A(3,4);
A(3,3) = A(3,3) - Kg^2*kt*km/Rm*B(3);

system = ss(A,B,C,D);