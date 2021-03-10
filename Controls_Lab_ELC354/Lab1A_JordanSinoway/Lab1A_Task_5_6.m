clear;
clc;

transfer_Fnc = 10* tf([1 1],[1 -4 0]);
system = feedback(transfer_Fnc, 1);
linearSystemAnalyzer(system)
