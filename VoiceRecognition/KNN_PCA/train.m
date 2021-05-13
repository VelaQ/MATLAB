%% 训练程序
%% 为了方便处理，做fft将数据化为等长形式
mu = 0.5 : 0.05 : 0.9;
numOfVec = zeros(1, length(mu));

%% 初始化
num = 128;
fftPoints = 1024;
voice_fft = zeros(fftPoints, num);
% 读取源数据并作fft
for j = 1 : num
    voice_fft(:, j) = fft(audioread(['C:\Users\Vela\OneDrive\桌面\语音信号处理\KNN\数据\训练样本\' num2str(j) '.wav']), fftPoints);
end

%% PCA计算
for i = 1 : length(mu)
    voice_PCA = PCA(abs(voice_fft), num, mu(i));
    % 存储训练集
    save(['voice_PCA_' num2str(mu(i)) '.csv'],'voice_PCA', '-ascii');
    [numOfVec(i), ~] = size(voice_PCA);
end

%% 绘图
plot(mu, numOfVec, 'Color','#A2142F','LineWidth', 2);title('PCA特征向量与阈值的关系')
axis([0.4 1 0 10])
figure(2)
stem(1:num , sum(abs(voice_PCA)),'LineWidth', 2);title('阈值\mu为0.9时，PCA得到的数据模值分布情况')