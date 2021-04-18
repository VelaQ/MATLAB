%% RayAWGN ģ�������ŵ������Ӹ�˹����
% outputSignal : ��������ź�
% G��˥��ϵ��
function [outputSignal , G] = RayAWGN(inputSignal, EbN0dB, M)
    % �źŵ����
    len = length(inputSignal);
    % �������������������ź���
    rayNoise = 1/sqrt(2)*(randn(1,len) + 1j*(randn(1,len)));
    %rayNoise = raylrnd(1/sqrt(2), 1, len) .* exp(2 * pi * 1j * rand(1, len));
    outputSignal = inputSignal .* rayNoise;
    % ˥��ϵ��
    G = rayNoise;
    
    % ��˹������ķ��ͨ�� EbNodB ����
    sigma_v2 = 10^(EbN0dB / -10) / (2 * log2(M));
    % ��˹�������׼��(ֻ���޸ķ����)
    sigma = sqrt(sigma_v2);
    % ��˹���������
    gaussNum1 = normrnd(0, sigma, [1 len]);
    gaussNum2 = normrnd(0, sigma, [1 len]);
    outputSignal = outputSignal + gaussNum1 + gaussNum2;
end
