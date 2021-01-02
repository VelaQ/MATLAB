% START

%{
% 单位抽样序列
n = -10:10; %坐标-10到10
x = zeros(1, 21); %产生1行，21列的0序列
x(11) = 1; % 令坐标n为0对应的信号值为1
stem(n, x); title('单位抽样序列'); %绘图
% 下一行为向左移动一位后的单位抽样序列
% stem(n-1,x); title('向左移动一位后的单位抽样序列');
axis([-10 10 -0.5 1.5]); %限定坐标范围，使图像更美观
%}

%{
% 单位阶跃序列
n = -10:10; %坐标-10到10
x = heaviside(n); %产生一个近似于单位阶跃序列的序列(但 n=0 时，其值为1/2，所以需要在下一行纠正)
x(11) = 1; %令坐标n为0对应的信号值为1
stem(n, x); title('单位阶跃序列'); %绘图
axis([-11 11 -0.5 1.5]); %限定坐标范围，使图像更美观
%}

%{
% 正弦序列
n = -10:10; %坐标-10到10
x = sin(0.4 * n); %产生正弦序列
stem(n, x); title('正弦序列'); %绘图
axis([-11 11 -1.5 1.5]); %限定坐标范围，使图像更美观
%}

%{
% 复正弦序列
n = -10:10; %坐标-10到10
x = exp(1j * 0.4 * n); %产生复正弦序列
subplot(2, 1, 1); %第一张图
stem(n, x); title('幅度谱'); %绘制幅度谱
axis([-11 11 -1.5 1.5]); %限定坐标范围，使图像更美观
subplot(2, 1, 2); %第一张图
stem(n, angle(x)); title('相位谱'); %绘制相位谱
axis([-11 11 -4 4]); %限定坐标范围，使图像更美观
%}

%{
% 指数序列
n = -10:10; %坐标-10到10
x = exp(0.5 * n); %产生指数序列
stem(n, x); title('指数序列'); %绘图
axis([-11 11 -0.5 160]); %限定坐标范围，使图像更美观
%}

% END
