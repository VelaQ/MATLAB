% c为输入分子项系数
c = [1 8 15];
% d为输入分母项系数
d = [1 7];
% 采样参数
T = 1;
% 获取结果
[A, B] = AF2DF(c, d, T);
disp(A);
disp(B);
